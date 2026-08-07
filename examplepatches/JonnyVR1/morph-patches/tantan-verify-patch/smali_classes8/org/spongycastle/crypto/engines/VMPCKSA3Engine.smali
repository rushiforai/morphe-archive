.class public Lorg/spongycastle/crypto/engines/VMPCKSA3Engine;
.super Lorg/spongycastle/crypto/engines/VMPCEngine;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/VMPCEngine;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "VMPC-KSA3"

    .line 2
    .line 3
    return-object p0
.end method

.method public initKey([B[B)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-byte v0, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 3
    .line 4
    const/16 v1, 0x100

    .line 5
    .line 6
    new-array v2, v1, [B

    .line 7
    .line 8
    iput-object v2, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->P:[B

    .line 9
    .line 10
    move v2, v0

    .line 11
    :goto_0
    if-ge v2, v1, :cond_0

    .line 12
    .line 13
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->P:[B

    .line 14
    .line 15
    int-to-byte v4, v2

    .line 16
    aput-byte v4, v3, v2

    .line 17
    .line 18
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v0

    .line 22
    :goto_1
    const/16 v2, 0x300

    .line 23
    .line 24
    if-ge v1, v2, :cond_1

    .line 25
    .line 26
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->P:[B

    .line 27
    .line 28
    iget-byte v3, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 29
    .line 30
    and-int/lit16 v4, v1, 0xff

    .line 31
    .line 32
    aget-byte v5, v2, v4

    .line 33
    .line 34
    add-int/2addr v3, v5

    .line 35
    array-length v6, p1

    .line 36
    rem-int v6, v1, v6

    .line 37
    .line 38
    aget-byte v6, p1, v6

    .line 39
    .line 40
    add-int/2addr v3, v6

    .line 41
    and-int/lit16 v3, v3, 0xff

    .line 42
    .line 43
    aget-byte v3, v2, v3

    .line 44
    .line 45
    iput-byte v3, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 46
    .line 47
    and-int/lit16 v6, v3, 0xff

    .line 48
    .line 49
    aget-byte v6, v2, v6

    .line 50
    .line 51
    aput-byte v6, v2, v4

    .line 52
    .line 53
    and-int/lit16 v3, v3, 0xff

    .line 54
    .line 55
    aput-byte v5, v2, v3

    .line 56
    .line 57
    add-int/lit8 v1, v1, 0x1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    move v1, v0

    .line 61
    :goto_2
    if-ge v1, v2, :cond_2

    .line 62
    .line 63
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->P:[B

    .line 64
    .line 65
    iget-byte v4, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 66
    .line 67
    and-int/lit16 v5, v1, 0xff

    .line 68
    .line 69
    aget-byte v6, v3, v5

    .line 70
    .line 71
    add-int/2addr v4, v6

    .line 72
    array-length v7, p2

    .line 73
    rem-int v7, v1, v7

    .line 74
    .line 75
    aget-byte v7, p2, v7

    .line 76
    .line 77
    add-int/2addr v4, v7

    .line 78
    and-int/lit16 v4, v4, 0xff

    .line 79
    .line 80
    aget-byte v4, v3, v4

    .line 81
    .line 82
    iput-byte v4, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 83
    .line 84
    and-int/lit16 v7, v4, 0xff

    .line 85
    .line 86
    aget-byte v7, v3, v7

    .line 87
    .line 88
    aput-byte v7, v3, v5

    .line 89
    .line 90
    and-int/lit16 v4, v4, 0xff

    .line 91
    .line 92
    aput-byte v6, v3, v4

    .line 93
    .line 94
    add-int/lit8 v1, v1, 0x1

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_2
    move p2, v0

    .line 98
    :goto_3
    if-ge p2, v2, :cond_3

    .line 99
    .line 100
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->P:[B

    .line 101
    .line 102
    iget-byte v3, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 103
    .line 104
    and-int/lit16 v4, p2, 0xff

    .line 105
    .line 106
    aget-byte v5, v1, v4

    .line 107
    .line 108
    add-int/2addr v3, v5

    .line 109
    array-length v6, p1

    .line 110
    rem-int v6, p2, v6

    .line 111
    .line 112
    aget-byte v6, p1, v6

    .line 113
    .line 114
    add-int/2addr v3, v6

    .line 115
    and-int/lit16 v3, v3, 0xff

    .line 116
    .line 117
    aget-byte v3, v1, v3

    .line 118
    .line 119
    iput-byte v3, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 120
    .line 121
    and-int/lit16 v6, v3, 0xff

    .line 122
    .line 123
    aget-byte v6, v1, v6

    .line 124
    .line 125
    aput-byte v6, v1, v4

    .line 126
    .line 127
    and-int/lit16 v3, v3, 0xff

    .line 128
    .line 129
    aput-byte v5, v1, v3

    .line 130
    .line 131
    add-int/lit8 p2, p2, 0x1

    .line 132
    .line 133
    goto :goto_3

    .line 134
    :cond_3
    iput-byte v0, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->n:B

    .line 135
    .line 136
    return-void
.end method
