.class public Lorg/spongycastle/crypto/engines/XSalsa20Engine;
.super Lorg/spongycastle/crypto/engines/Salsa20Engine;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "XSalsa20"

    .line 2
    .line 3
    return-object p0
.end method

.method public getNonceSize()I
    .locals 0

    const/16 p0, 0x18

    return p0
.end method

.method public setKey([B[B)V
    .locals 9

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    const/16 v1, 0x20

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-super {p0, p1, p2}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->setKey([B[B)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 12
    .line 13
    const/16 v0, 0x8

    .line 14
    .line 15
    invoke-static {p2, v0}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    aput v1, p1, v0

    .line 20
    .line 21
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 22
    .line 23
    const/16 v1, 0xc

    .line 24
    .line 25
    invoke-static {p2, v1}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/16 v3, 0x9

    .line 30
    .line 31
    aput v2, p1, v3

    .line 32
    .line 33
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 34
    .line 35
    array-length v2, p1

    .line 36
    new-array v2, v2, [I

    .line 37
    .line 38
    const/16 v4, 0x14

    .line 39
    .line 40
    invoke-static {v4, p1, v2}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->salsaCore(I[I[I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 44
    .line 45
    const/4 v5, 0x0

    .line 46
    aget v6, v2, v5

    .line 47
    .line 48
    aget v5, p1, v5

    .line 49
    .line 50
    sub-int/2addr v6, v5

    .line 51
    const/4 v5, 0x1

    .line 52
    aput v6, p1, v5

    .line 53
    .line 54
    const/4 v5, 0x5

    .line 55
    aget v6, v2, v5

    .line 56
    .line 57
    aget v5, p1, v5

    .line 58
    .line 59
    sub-int/2addr v6, v5

    .line 60
    const/4 v5, 0x2

    .line 61
    aput v6, p1, v5

    .line 62
    .line 63
    const/16 v5, 0xa

    .line 64
    .line 65
    aget v6, v2, v5

    .line 66
    .line 67
    aget v5, p1, v5

    .line 68
    .line 69
    sub-int/2addr v6, v5

    .line 70
    const/4 v5, 0x3

    .line 71
    aput v6, p1, v5

    .line 72
    .line 73
    const/16 v5, 0xf

    .line 74
    .line 75
    aget v6, v2, v5

    .line 76
    .line 77
    aget v5, p1, v5

    .line 78
    .line 79
    sub-int/2addr v6, v5

    .line 80
    const/4 v5, 0x4

    .line 81
    aput v6, p1, v5

    .line 82
    .line 83
    const/4 v5, 0x6

    .line 84
    aget v6, v2, v5

    .line 85
    .line 86
    aget v7, p1, v5

    .line 87
    .line 88
    sub-int/2addr v6, v7

    .line 89
    const/16 v7, 0xb

    .line 90
    .line 91
    aput v6, p1, v7

    .line 92
    .line 93
    const/4 v6, 0x7

    .line 94
    aget v7, v2, v6

    .line 95
    .line 96
    aget v8, p1, v6

    .line 97
    .line 98
    sub-int/2addr v7, v8

    .line 99
    aput v7, p1, v1

    .line 100
    .line 101
    aget v1, v2, v0

    .line 102
    .line 103
    aget v0, p1, v0

    .line 104
    .line 105
    sub-int/2addr v1, v0

    .line 106
    const/16 v0, 0xd

    .line 107
    .line 108
    aput v1, p1, v0

    .line 109
    .line 110
    aget v0, v2, v3

    .line 111
    .line 112
    aget v1, p1, v3

    .line 113
    .line 114
    sub-int/2addr v0, v1

    .line 115
    const/16 v1, 0xe

    .line 116
    .line 117
    aput v0, p1, v1

    .line 118
    .line 119
    const/16 v0, 0x10

    .line 120
    .line 121
    invoke-static {p2, v0}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    aput v0, p1, v5

    .line 126
    .line 127
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 128
    .line 129
    invoke-static {p2, v4}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    aput p1, p0, v6

    .line 134
    .line 135
    return-void

    .line 136
    :cond_0
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/XSalsa20Engine;->getAlgorithmName()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    const-string p1, " requires a 256 bit key"

    .line 141
    .line 142
    invoke-static {p0, p1}, Ll/iki;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_1
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/XSalsa20Engine;->getAlgorithmName()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    const-string p1, " doesn\'t support re-init with null key"

    .line 151
    .line 152
    invoke-static {p0, p1}, Ll/iki;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    return-void
.end method
