.class public final Lorg/spongycastle/crypto/engines/CAST6Engine;
.super Lorg/spongycastle/crypto/engines/CAST5Engine;
.source "SourceFile"


# static fields
.field protected static final BLOCK_SIZE:I = 0x10

.field protected static final ROUNDS:I = 0xc


# instance fields
.field protected _Km:[I

.field protected _Kr:[I

.field protected _Tm:[I

.field protected _Tr:[I

.field private _workingKey:[I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/CAST5Engine;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x30

    .line 5
    .line 6
    new-array v1, v0, [I

    .line 7
    .line 8
    iput-object v1, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 9
    .line 10
    new-array v0, v0, [I

    .line 11
    .line 12
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 13
    .line 14
    const/16 v0, 0xc0

    .line 15
    .line 16
    new-array v1, v0, [I

    .line 17
    .line 18
    iput-object v1, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 19
    .line 20
    new-array v0, v0, [I

    .line 21
    .line 22
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 23
    .line 24
    const/16 v0, 0x8

    .line 25
    .line 26
    new-array v0, v0, [I

    .line 27
    .line 28
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final CAST_Decipher(IIII[I)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/4 v2, 0x6

    .line 4
    const/4 v3, 0x3

    .line 5
    if-ge v1, v2, :cond_0

    .line 6
    .line 7
    rsub-int/lit8 v2, v1, 0xb

    .line 8
    .line 9
    mul-int/lit8 v2, v2, 0x4

    .line 10
    .line 11
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 12
    .line 13
    aget v4, v4, v2

    .line 14
    .line 15
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 16
    .line 17
    aget v5, v5, v2

    .line 18
    .line 19
    invoke-virtual {p0, p4, v4, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    xor-int/2addr p3, v4

    .line 24
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 25
    .line 26
    add-int/lit8 v5, v2, 0x1

    .line 27
    .line 28
    aget v4, v4, v5

    .line 29
    .line 30
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 31
    .line 32
    aget v5, v6, v5

    .line 33
    .line 34
    invoke-virtual {p0, p3, v4, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F2(III)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    xor-int/2addr p2, v4

    .line 39
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 40
    .line 41
    add-int/lit8 v5, v2, 0x2

    .line 42
    .line 43
    aget v4, v4, v5

    .line 44
    .line 45
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 46
    .line 47
    aget v5, v6, v5

    .line 48
    .line 49
    invoke-virtual {p0, p2, v4, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F3(III)I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    xor-int/2addr p1, v4

    .line 54
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 55
    .line 56
    add-int/2addr v2, v3

    .line 57
    aget v3, v4, v2

    .line 58
    .line 59
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 60
    .line 61
    aget v2, v4, v2

    .line 62
    .line 63
    invoke-virtual {p0, p1, v3, v2}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    xor-int/2addr p4, v2

    .line 68
    add-int/lit8 v1, v1, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    :goto_1
    const/16 v1, 0xc

    .line 72
    .line 73
    if-ge v2, v1, :cond_1

    .line 74
    .line 75
    rsub-int/lit8 v1, v2, 0xb

    .line 76
    .line 77
    mul-int/lit8 v1, v1, 0x4

    .line 78
    .line 79
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 80
    .line 81
    add-int/lit8 v5, v1, 0x3

    .line 82
    .line 83
    aget v4, v4, v5

    .line 84
    .line 85
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 86
    .line 87
    aget v5, v6, v5

    .line 88
    .line 89
    invoke-virtual {p0, p1, v4, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    xor-int/2addr p4, v4

    .line 94
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 95
    .line 96
    add-int/lit8 v5, v1, 0x2

    .line 97
    .line 98
    aget v4, v4, v5

    .line 99
    .line 100
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 101
    .line 102
    aget v5, v6, v5

    .line 103
    .line 104
    invoke-virtual {p0, p2, v4, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F3(III)I

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    xor-int/2addr p1, v4

    .line 109
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 110
    .line 111
    add-int/lit8 v5, v1, 0x1

    .line 112
    .line 113
    aget v4, v4, v5

    .line 114
    .line 115
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 116
    .line 117
    aget v5, v6, v5

    .line 118
    .line 119
    invoke-virtual {p0, p3, v4, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F2(III)I

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    xor-int/2addr p2, v4

    .line 124
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 125
    .line 126
    aget v4, v4, v1

    .line 127
    .line 128
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 129
    .line 130
    aget v1, v5, v1

    .line 131
    .line 132
    invoke-virtual {p0, p4, v4, v1}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    xor-int/2addr p3, v1

    .line 137
    add-int/lit8 v2, v2, 0x1

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_1
    aput p1, p5, v0

    .line 141
    .line 142
    const/4 p0, 0x1

    .line 143
    aput p2, p5, p0

    .line 144
    .line 145
    const/4 p0, 0x2

    .line 146
    aput p3, p5, p0

    .line 147
    .line 148
    aput p4, p5, v3

    .line 149
    .line 150
    return-void
.end method

.method public final CAST_Encipher(IIII[I)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/4 v2, 0x6

    .line 4
    const/4 v3, 0x3

    .line 5
    if-ge v1, v2, :cond_0

    .line 6
    .line 7
    mul-int/lit8 v2, v1, 0x4

    .line 8
    .line 9
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 10
    .line 11
    aget v4, v4, v2

    .line 12
    .line 13
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 14
    .line 15
    aget v5, v5, v2

    .line 16
    .line 17
    invoke-virtual {p0, p4, v4, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    xor-int/2addr p3, v4

    .line 22
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 23
    .line 24
    add-int/lit8 v5, v2, 0x1

    .line 25
    .line 26
    aget v4, v4, v5

    .line 27
    .line 28
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 29
    .line 30
    aget v5, v6, v5

    .line 31
    .line 32
    invoke-virtual {p0, p3, v4, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F2(III)I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    xor-int/2addr p2, v4

    .line 37
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 38
    .line 39
    add-int/lit8 v5, v2, 0x2

    .line 40
    .line 41
    aget v4, v4, v5

    .line 42
    .line 43
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 44
    .line 45
    aget v5, v6, v5

    .line 46
    .line 47
    invoke-virtual {p0, p2, v4, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F3(III)I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    xor-int/2addr p1, v4

    .line 52
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 53
    .line 54
    add-int/2addr v2, v3

    .line 55
    aget v3, v4, v2

    .line 56
    .line 57
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 58
    .line 59
    aget v2, v4, v2

    .line 60
    .line 61
    invoke-virtual {p0, p1, v3, v2}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    xor-int/2addr p4, v2

    .line 66
    add-int/lit8 v1, v1, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    :goto_1
    const/16 v1, 0xc

    .line 70
    .line 71
    if-ge v2, v1, :cond_1

    .line 72
    .line 73
    mul-int/lit8 v1, v2, 0x4

    .line 74
    .line 75
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 76
    .line 77
    add-int/lit8 v5, v1, 0x3

    .line 78
    .line 79
    aget v4, v4, v5

    .line 80
    .line 81
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 82
    .line 83
    aget v5, v6, v5

    .line 84
    .line 85
    invoke-virtual {p0, p1, v4, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    xor-int/2addr p4, v4

    .line 90
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 91
    .line 92
    add-int/lit8 v5, v1, 0x2

    .line 93
    .line 94
    aget v4, v4, v5

    .line 95
    .line 96
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 97
    .line 98
    aget v5, v6, v5

    .line 99
    .line 100
    invoke-virtual {p0, p2, v4, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F3(III)I

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    xor-int/2addr p1, v4

    .line 105
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 106
    .line 107
    add-int/lit8 v5, v1, 0x1

    .line 108
    .line 109
    aget v4, v4, v5

    .line 110
    .line 111
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 112
    .line 113
    aget v5, v6, v5

    .line 114
    .line 115
    invoke-virtual {p0, p3, v4, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F2(III)I

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    xor-int/2addr p2, v4

    .line 120
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 121
    .line 122
    aget v4, v4, v1

    .line 123
    .line 124
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 125
    .line 126
    aget v1, v5, v1

    .line 127
    .line 128
    invoke-virtual {p0, p4, v4, v1}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    xor-int/2addr p3, v1

    .line 133
    add-int/lit8 v2, v2, 0x1

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_1
    aput p1, p5, v0

    .line 137
    .line 138
    const/4 p0, 0x1

    .line 139
    aput p2, p5, p0

    .line 140
    .line 141
    const/4 p0, 0x2

    .line 142
    aput p3, p5, p0

    .line 143
    .line 144
    aput p4, p5, v3

    .line 145
    .line 146
    return-void
.end method

.method public decryptBlock([BI[BI)I
    .locals 7

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v6, v0, [I

    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lorg/spongycastle/crypto/engines/CAST5Engine;->BytesTo32bits([BI)I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    add-int/lit8 v0, p2, 0x4

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lorg/spongycastle/crypto/engines/CAST5Engine;->BytesTo32bits([BI)I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    add-int/lit8 v0, p2, 0x8

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, Lorg/spongycastle/crypto/engines/CAST5Engine;->BytesTo32bits([BI)I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    add-int/lit8 p2, p2, 0xc

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Lorg/spongycastle/crypto/engines/CAST5Engine;->BytesTo32bits([BI)I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    move-object v1, p0

    .line 27
    invoke-virtual/range {v1 .. v6}, Lorg/spongycastle/crypto/engines/CAST6Engine;->CAST_Decipher(IIII[I)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    aget p0, v6, p0

    .line 32
    .line 33
    invoke-virtual {v1, p0, p3, p4}, Lorg/spongycastle/crypto/engines/CAST5Engine;->Bits32ToBytes(I[BI)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    aget p0, v6, p0

    .line 38
    .line 39
    add-int/lit8 p1, p4, 0x4

    .line 40
    .line 41
    invoke-virtual {v1, p0, p3, p1}, Lorg/spongycastle/crypto/engines/CAST5Engine;->Bits32ToBytes(I[BI)V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x2

    .line 45
    aget p0, v6, p0

    .line 46
    .line 47
    add-int/lit8 p1, p4, 0x8

    .line 48
    .line 49
    invoke-virtual {v1, p0, p3, p1}, Lorg/spongycastle/crypto/engines/CAST5Engine;->Bits32ToBytes(I[BI)V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x3

    .line 53
    aget p0, v6, p0

    .line 54
    .line 55
    add-int/lit8 p4, p4, 0xc

    .line 56
    .line 57
    invoke-virtual {v1, p0, p3, p4}, Lorg/spongycastle/crypto/engines/CAST5Engine;->Bits32ToBytes(I[BI)V

    .line 58
    .line 59
    .line 60
    const/16 p0, 0x10

    .line 61
    .line 62
    return p0
.end method

.method public encryptBlock([BI[BI)I
    .locals 7

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v6, v0, [I

    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lorg/spongycastle/crypto/engines/CAST5Engine;->BytesTo32bits([BI)I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    add-int/lit8 v0, p2, 0x4

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lorg/spongycastle/crypto/engines/CAST5Engine;->BytesTo32bits([BI)I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    add-int/lit8 v0, p2, 0x8

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, Lorg/spongycastle/crypto/engines/CAST5Engine;->BytesTo32bits([BI)I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    add-int/lit8 p2, p2, 0xc

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Lorg/spongycastle/crypto/engines/CAST5Engine;->BytesTo32bits([BI)I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    move-object v1, p0

    .line 27
    invoke-virtual/range {v1 .. v6}, Lorg/spongycastle/crypto/engines/CAST6Engine;->CAST_Encipher(IIII[I)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    aget p0, v6, p0

    .line 32
    .line 33
    invoke-virtual {v1, p0, p3, p4}, Lorg/spongycastle/crypto/engines/CAST5Engine;->Bits32ToBytes(I[BI)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    aget p0, v6, p0

    .line 38
    .line 39
    add-int/lit8 p1, p4, 0x4

    .line 40
    .line 41
    invoke-virtual {v1, p0, p3, p1}, Lorg/spongycastle/crypto/engines/CAST5Engine;->Bits32ToBytes(I[BI)V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x2

    .line 45
    aget p0, v6, p0

    .line 46
    .line 47
    add-int/lit8 p1, p4, 0x8

    .line 48
    .line 49
    invoke-virtual {v1, p0, p3, p1}, Lorg/spongycastle/crypto/engines/CAST5Engine;->Bits32ToBytes(I[BI)V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x3

    .line 53
    aget p0, v6, p0

    .line 54
    .line 55
    add-int/lit8 p4, p4, 0xc

    .line 56
    .line 57
    invoke-virtual {v1, p0, p3, p4}, Lorg/spongycastle/crypto/engines/CAST5Engine;->Bits32ToBytes(I[BI)V

    .line 58
    .line 59
    .line 60
    const/16 p0, 0x10

    .line 61
    .line 62
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "CAST6"

    .line 2
    .line 3
    return-object p0
.end method

.method public getBlockSize()I
    .locals 0

    const/16 p0, 0x10

    return p0
.end method

.method public reset()V
    .locals 0

    return-void
.end method

.method public setKey([B)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const v2, 0x5a827999

    .line 6
    .line 7
    .line 8
    const/16 v3, 0x13

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    move v5, v4

    .line 12
    :goto_0
    const/16 v6, 0x18

    .line 13
    .line 14
    const/16 v7, 0x8

    .line 15
    .line 16
    if-ge v5, v6, :cond_1

    .line 17
    .line 18
    move v6, v4

    .line 19
    :goto_1
    if-ge v6, v7, :cond_0

    .line 20
    .line 21
    iget-object v8, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 22
    .line 23
    mul-int/lit8 v9, v5, 0x8

    .line 24
    .line 25
    add-int/2addr v9, v6

    .line 26
    aput v2, v8, v9

    .line 27
    .line 28
    const v8, 0x6ed9eba1

    .line 29
    .line 30
    .line 31
    add-int/2addr v2, v8

    .line 32
    iget-object v8, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 33
    .line 34
    aput v3, v8, v9

    .line 35
    .line 36
    add-int/lit8 v3, v3, 0x11

    .line 37
    .line 38
    and-int/lit8 v3, v3, 0x1f

    .line 39
    .line 40
    add-int/lit8 v6, v6, 0x1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_0
    add-int/lit8 v5, v5, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/16 v2, 0x40

    .line 47
    .line 48
    new-array v2, v2, [B

    .line 49
    .line 50
    array-length v3, v1

    .line 51
    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 52
    .line 53
    .line 54
    move v1, v4

    .line 55
    :goto_2
    if-ge v1, v7, :cond_2

    .line 56
    .line 57
    iget-object v3, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 58
    .line 59
    mul-int/lit8 v5, v1, 0x4

    .line 60
    .line 61
    invoke-virtual {v0, v2, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->BytesTo32bits([BI)I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    aput v5, v3, v1

    .line 66
    .line 67
    add-int/lit8 v1, v1, 0x1

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_2
    move v1, v4

    .line 71
    :goto_3
    const/16 v2, 0xc

    .line 72
    .line 73
    if-ge v1, v2, :cond_3

    .line 74
    .line 75
    mul-int/lit8 v2, v1, 0x2

    .line 76
    .line 77
    mul-int/lit8 v3, v1, 0x10

    .line 78
    .line 79
    iget-object v5, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 80
    .line 81
    const/4 v6, 0x6

    .line 82
    aget v8, v5, v6

    .line 83
    .line 84
    const/4 v9, 0x7

    .line 85
    aget v10, v5, v9

    .line 86
    .line 87
    iget-object v11, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 88
    .line 89
    aget v11, v11, v3

    .line 90
    .line 91
    iget-object v12, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 92
    .line 93
    aget v12, v12, v3

    .line 94
    .line 95
    invoke-virtual {v0, v10, v11, v12}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 96
    .line 97
    .line 98
    move-result v10

    .line 99
    xor-int/2addr v8, v10

    .line 100
    aput v8, v5, v6

    .line 101
    .line 102
    iget-object v5, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 103
    .line 104
    const/4 v8, 0x5

    .line 105
    aget v10, v5, v8

    .line 106
    .line 107
    aget v11, v5, v6

    .line 108
    .line 109
    iget-object v12, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 110
    .line 111
    add-int/lit8 v13, v3, 0x1

    .line 112
    .line 113
    aget v12, v12, v13

    .line 114
    .line 115
    iget-object v14, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 116
    .line 117
    aget v13, v14, v13

    .line 118
    .line 119
    invoke-virtual {v0, v11, v12, v13}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F2(III)I

    .line 120
    .line 121
    .line 122
    move-result v11

    .line 123
    xor-int/2addr v10, v11

    .line 124
    aput v10, v5, v8

    .line 125
    .line 126
    iget-object v5, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 127
    .line 128
    const/4 v10, 0x4

    .line 129
    aget v11, v5, v10

    .line 130
    .line 131
    aget v12, v5, v8

    .line 132
    .line 133
    iget-object v13, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 134
    .line 135
    add-int/lit8 v14, v3, 0x2

    .line 136
    .line 137
    aget v13, v13, v14

    .line 138
    .line 139
    iget-object v15, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 140
    .line 141
    aget v14, v15, v14

    .line 142
    .line 143
    invoke-virtual {v0, v12, v13, v14}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F3(III)I

    .line 144
    .line 145
    .line 146
    move-result v12

    .line 147
    xor-int/2addr v11, v12

    .line 148
    aput v11, v5, v10

    .line 149
    .line 150
    iget-object v5, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 151
    .line 152
    const/4 v11, 0x3

    .line 153
    aget v12, v5, v11

    .line 154
    .line 155
    aget v13, v5, v10

    .line 156
    .line 157
    iget-object v14, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 158
    .line 159
    add-int/lit8 v15, v3, 0x3

    .line 160
    .line 161
    aget v14, v14, v15

    .line 162
    .line 163
    move/from16 v16, v4

    .line 164
    .line 165
    iget-object v4, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 166
    .line 167
    aget v4, v4, v15

    .line 168
    .line 169
    invoke-virtual {v0, v13, v14, v4}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    xor-int/2addr v4, v12

    .line 174
    aput v4, v5, v11

    .line 175
    .line 176
    iget-object v4, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 177
    .line 178
    const/4 v5, 0x2

    .line 179
    aget v12, v4, v5

    .line 180
    .line 181
    aget v13, v4, v11

    .line 182
    .line 183
    iget-object v14, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 184
    .line 185
    add-int/lit8 v15, v3, 0x4

    .line 186
    .line 187
    aget v14, v14, v15

    .line 188
    .line 189
    move/from16 p1, v5

    .line 190
    .line 191
    iget-object v5, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 192
    .line 193
    aget v5, v5, v15

    .line 194
    .line 195
    invoke-virtual {v0, v13, v14, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F2(III)I

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    xor-int/2addr v5, v12

    .line 200
    aput v5, v4, p1

    .line 201
    .line 202
    iget-object v4, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 203
    .line 204
    const/4 v5, 0x1

    .line 205
    aget v12, v4, v5

    .line 206
    .line 207
    aget v13, v4, p1

    .line 208
    .line 209
    iget-object v14, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 210
    .line 211
    add-int/lit8 v15, v3, 0x5

    .line 212
    .line 213
    aget v14, v14, v15

    .line 214
    .line 215
    move/from16 v17, v5

    .line 216
    .line 217
    iget-object v5, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 218
    .line 219
    aget v5, v5, v15

    .line 220
    .line 221
    invoke-virtual {v0, v13, v14, v5}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F3(III)I

    .line 222
    .line 223
    .line 224
    move-result v5

    .line 225
    xor-int/2addr v5, v12

    .line 226
    aput v5, v4, v17

    .line 227
    .line 228
    iget-object v4, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 229
    .line 230
    aget v5, v4, v16

    .line 231
    .line 232
    aget v12, v4, v17

    .line 233
    .line 234
    iget-object v13, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 235
    .line 236
    add-int/lit8 v14, v3, 0x6

    .line 237
    .line 238
    aget v13, v13, v14

    .line 239
    .line 240
    iget-object v15, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 241
    .line 242
    aget v14, v15, v14

    .line 243
    .line 244
    invoke-virtual {v0, v12, v13, v14}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 245
    .line 246
    .line 247
    move-result v12

    .line 248
    xor-int/2addr v5, v12

    .line 249
    aput v5, v4, v16

    .line 250
    .line 251
    iget-object v4, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 252
    .line 253
    aget v5, v4, v9

    .line 254
    .line 255
    aget v12, v4, v16

    .line 256
    .line 257
    iget-object v13, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 258
    .line 259
    add-int/2addr v3, v9

    .line 260
    aget v13, v13, v3

    .line 261
    .line 262
    iget-object v14, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 263
    .line 264
    aget v3, v14, v3

    .line 265
    .line 266
    invoke-virtual {v0, v12, v13, v3}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F2(III)I

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    xor-int/2addr v3, v5

    .line 271
    aput v3, v4, v9

    .line 272
    .line 273
    add-int/lit8 v2, v2, 0x1

    .line 274
    .line 275
    mul-int/2addr v2, v7

    .line 276
    iget-object v3, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 277
    .line 278
    aget v4, v3, v6

    .line 279
    .line 280
    aget v5, v3, v9

    .line 281
    .line 282
    iget-object v12, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 283
    .line 284
    aget v12, v12, v2

    .line 285
    .line 286
    iget-object v13, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 287
    .line 288
    aget v13, v13, v2

    .line 289
    .line 290
    invoke-virtual {v0, v5, v12, v13}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 291
    .line 292
    .line 293
    move-result v5

    .line 294
    xor-int/2addr v4, v5

    .line 295
    aput v4, v3, v6

    .line 296
    .line 297
    iget-object v3, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 298
    .line 299
    aget v4, v3, v8

    .line 300
    .line 301
    aget v5, v3, v6

    .line 302
    .line 303
    iget-object v12, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 304
    .line 305
    add-int/lit8 v13, v2, 0x1

    .line 306
    .line 307
    aget v12, v12, v13

    .line 308
    .line 309
    iget-object v14, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 310
    .line 311
    aget v13, v14, v13

    .line 312
    .line 313
    invoke-virtual {v0, v5, v12, v13}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F2(III)I

    .line 314
    .line 315
    .line 316
    move-result v5

    .line 317
    xor-int/2addr v4, v5

    .line 318
    aput v4, v3, v8

    .line 319
    .line 320
    iget-object v3, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 321
    .line 322
    aget v4, v3, v10

    .line 323
    .line 324
    aget v5, v3, v8

    .line 325
    .line 326
    iget-object v12, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 327
    .line 328
    add-int/lit8 v13, v2, 0x2

    .line 329
    .line 330
    aget v12, v12, v13

    .line 331
    .line 332
    iget-object v14, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 333
    .line 334
    aget v13, v14, v13

    .line 335
    .line 336
    invoke-virtual {v0, v5, v12, v13}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F3(III)I

    .line 337
    .line 338
    .line 339
    move-result v5

    .line 340
    xor-int/2addr v4, v5

    .line 341
    aput v4, v3, v10

    .line 342
    .line 343
    iget-object v3, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 344
    .line 345
    aget v4, v3, v11

    .line 346
    .line 347
    aget v5, v3, v10

    .line 348
    .line 349
    iget-object v12, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 350
    .line 351
    add-int/lit8 v13, v2, 0x3

    .line 352
    .line 353
    aget v12, v12, v13

    .line 354
    .line 355
    iget-object v14, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 356
    .line 357
    aget v13, v14, v13

    .line 358
    .line 359
    invoke-virtual {v0, v5, v12, v13}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 360
    .line 361
    .line 362
    move-result v5

    .line 363
    xor-int/2addr v4, v5

    .line 364
    aput v4, v3, v11

    .line 365
    .line 366
    iget-object v3, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 367
    .line 368
    aget v4, v3, p1

    .line 369
    .line 370
    aget v5, v3, v11

    .line 371
    .line 372
    iget-object v12, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 373
    .line 374
    add-int/lit8 v13, v2, 0x4

    .line 375
    .line 376
    aget v12, v12, v13

    .line 377
    .line 378
    iget-object v14, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 379
    .line 380
    aget v13, v14, v13

    .line 381
    .line 382
    invoke-virtual {v0, v5, v12, v13}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F2(III)I

    .line 383
    .line 384
    .line 385
    move-result v5

    .line 386
    xor-int/2addr v4, v5

    .line 387
    aput v4, v3, p1

    .line 388
    .line 389
    iget-object v3, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 390
    .line 391
    aget v4, v3, v17

    .line 392
    .line 393
    aget v5, v3, p1

    .line 394
    .line 395
    iget-object v12, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 396
    .line 397
    add-int/lit8 v13, v2, 0x5

    .line 398
    .line 399
    aget v12, v12, v13

    .line 400
    .line 401
    iget-object v14, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 402
    .line 403
    aget v13, v14, v13

    .line 404
    .line 405
    invoke-virtual {v0, v5, v12, v13}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F3(III)I

    .line 406
    .line 407
    .line 408
    move-result v5

    .line 409
    xor-int/2addr v4, v5

    .line 410
    aput v4, v3, v17

    .line 411
    .line 412
    iget-object v3, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 413
    .line 414
    aget v4, v3, v16

    .line 415
    .line 416
    aget v5, v3, v17

    .line 417
    .line 418
    iget-object v12, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 419
    .line 420
    add-int/lit8 v13, v2, 0x6

    .line 421
    .line 422
    aget v12, v12, v13

    .line 423
    .line 424
    iget-object v14, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 425
    .line 426
    aget v13, v14, v13

    .line 427
    .line 428
    invoke-virtual {v0, v5, v12, v13}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F1(III)I

    .line 429
    .line 430
    .line 431
    move-result v5

    .line 432
    xor-int/2addr v4, v5

    .line 433
    aput v4, v3, v16

    .line 434
    .line 435
    iget-object v3, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 436
    .line 437
    aget v4, v3, v9

    .line 438
    .line 439
    aget v5, v3, v16

    .line 440
    .line 441
    iget-object v12, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tm:[I

    .line 442
    .line 443
    add-int/2addr v2, v9

    .line 444
    aget v12, v12, v2

    .line 445
    .line 446
    iget-object v13, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Tr:[I

    .line 447
    .line 448
    aget v2, v13, v2

    .line 449
    .line 450
    invoke-virtual {v0, v5, v12, v2}, Lorg/spongycastle/crypto/engines/CAST5Engine;->F2(III)I

    .line 451
    .line 452
    .line 453
    move-result v2

    .line 454
    xor-int/2addr v2, v4

    .line 455
    aput v2, v3, v9

    .line 456
    .line 457
    iget-object v2, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Kr:[I

    .line 458
    .line 459
    mul-int/lit8 v3, v1, 0x4

    .line 460
    .line 461
    iget-object v4, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_workingKey:[I

    .line 462
    .line 463
    aget v5, v4, v16

    .line 464
    .line 465
    and-int/lit8 v5, v5, 0x1f

    .line 466
    .line 467
    aput v5, v2, v3

    .line 468
    .line 469
    add-int/lit8 v5, v3, 0x1

    .line 470
    .line 471
    aget v12, v4, p1

    .line 472
    .line 473
    and-int/lit8 v12, v12, 0x1f

    .line 474
    .line 475
    aput v12, v2, v5

    .line 476
    .line 477
    add-int/lit8 v12, v3, 0x2

    .line 478
    .line 479
    aget v10, v4, v10

    .line 480
    .line 481
    and-int/lit8 v10, v10, 0x1f

    .line 482
    .line 483
    aput v10, v2, v12

    .line 484
    .line 485
    add-int/lit8 v10, v3, 0x3

    .line 486
    .line 487
    aget v6, v4, v6

    .line 488
    .line 489
    and-int/lit8 v6, v6, 0x1f

    .line 490
    .line 491
    aput v6, v2, v10

    .line 492
    .line 493
    iget-object v2, v0, Lorg/spongycastle/crypto/engines/CAST6Engine;->_Km:[I

    .line 494
    .line 495
    aget v6, v4, v9

    .line 496
    .line 497
    aput v6, v2, v3

    .line 498
    .line 499
    aget v3, v4, v8

    .line 500
    .line 501
    aput v3, v2, v5

    .line 502
    .line 503
    aget v3, v4, v11

    .line 504
    .line 505
    aput v3, v2, v12

    .line 506
    .line 507
    aget v3, v4, v17

    .line 508
    .line 509
    aput v3, v2, v10

    .line 510
    .line 511
    add-int/lit8 v1, v1, 0x1

    .line 512
    .line 513
    move/from16 v4, v16

    .line 514
    .line 515
    goto/16 :goto_3

    .line 516
    .line 517
    :cond_3
    return-void
.end method
