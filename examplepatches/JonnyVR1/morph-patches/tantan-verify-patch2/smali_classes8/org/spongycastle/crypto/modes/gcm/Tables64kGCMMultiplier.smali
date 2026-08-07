.class public Lorg/spongycastle/crypto/modes/gcm/Tables64kGCMMultiplier;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;


# instance fields
.field private H:[B

.field private M:[[[I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public init([B)V
    .locals 11

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/gcm/Tables64kGCMMultiplier;->M:[[[I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/16 v2, 0x100

    .line 5
    .line 6
    const/16 v3, 0x10

    .line 7
    .line 8
    const/4 v4, 0x0

    .line 9
    const/4 v5, 0x1

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    new-array v0, v0, [I

    .line 14
    .line 15
    const/4 v6, 0x4

    .line 16
    aput v6, v0, v1

    .line 17
    .line 18
    aput v2, v0, v5

    .line 19
    .line 20
    aput v3, v0, v4

    .line 21
    .line 22
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 23
    .line 24
    invoke-static {v6, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, [[[I

    .line 29
    .line 30
    iput-object v0, p0, Lorg/spongycastle/crypto/modes/gcm/Tables64kGCMMultiplier;->M:[[[I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/gcm/Tables64kGCMMultiplier;->H:[B

    .line 34
    .line 35
    invoke-static {v0, p1}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    goto :goto_5

    .line 42
    :cond_1
    :goto_0
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lorg/spongycastle/crypto/modes/gcm/Tables64kGCMMultiplier;->H:[B

    .line 47
    .line 48
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/gcm/Tables64kGCMMultiplier;->M:[[[I

    .line 49
    .line 50
    aget-object v0, v0, v4

    .line 51
    .line 52
    const/16 v6, 0x80

    .line 53
    .line 54
    aget-object v0, v0, v6

    .line 55
    .line 56
    invoke-static {p1, v0}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->asInts([B[I)V

    .line 57
    .line 58
    .line 59
    const/16 p1, 0x40

    .line 60
    .line 61
    :goto_1
    if-lt p1, v5, :cond_2

    .line 62
    .line 63
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/gcm/Tables64kGCMMultiplier;->M:[[[I

    .line 64
    .line 65
    aget-object v0, v0, v4

    .line 66
    .line 67
    add-int v7, p1, p1

    .line 68
    .line 69
    aget-object v7, v0, v7

    .line 70
    .line 71
    aget-object v0, v0, p1

    .line 72
    .line 73
    invoke-static {v7, v0}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->multiplyP([I[I)V

    .line 74
    .line 75
    .line 76
    shr-int/lit8 p1, p1, 0x1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    :goto_2
    move p1, v1

    .line 80
    :goto_3
    if-ge p1, v2, :cond_4

    .line 81
    .line 82
    move v0, v5

    .line 83
    :goto_4
    if-ge v0, p1, :cond_3

    .line 84
    .line 85
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/gcm/Tables64kGCMMultiplier;->M:[[[I

    .line 86
    .line 87
    aget-object v7, v7, v4

    .line 88
    .line 89
    aget-object v8, v7, p1

    .line 90
    .line 91
    aget-object v9, v7, v0

    .line 92
    .line 93
    add-int v10, p1, v0

    .line 94
    .line 95
    aget-object v7, v7, v10

    .line 96
    .line 97
    invoke-static {v8, v9, v7}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([I[I[I)V

    .line 98
    .line 99
    .line 100
    add-int/lit8 v0, v0, 0x1

    .line 101
    .line 102
    goto :goto_4

    .line 103
    :cond_3
    add-int/2addr p1, p1

    .line 104
    goto :goto_3

    .line 105
    :cond_4
    add-int/lit8 p1, v4, 0x1

    .line 106
    .line 107
    if-ne p1, v3, :cond_5

    .line 108
    .line 109
    :goto_5
    return-void

    .line 110
    :cond_5
    move v0, v6

    .line 111
    :goto_6
    if-lez v0, :cond_6

    .line 112
    .line 113
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/gcm/Tables64kGCMMultiplier;->M:[[[I

    .line 114
    .line 115
    aget-object v8, v7, v4

    .line 116
    .line 117
    aget-object v8, v8, v0

    .line 118
    .line 119
    aget-object v7, v7, p1

    .line 120
    .line 121
    aget-object v7, v7, v0

    .line 122
    .line 123
    invoke-static {v8, v7}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->multiplyP8([I[I)V

    .line 124
    .line 125
    .line 126
    shr-int/lit8 v0, v0, 0x1

    .line 127
    .line 128
    goto :goto_6

    .line 129
    :cond_6
    move v4, p1

    .line 130
    goto :goto_2
.end method

.method public multiplyH([B)V
    .locals 6

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    const/16 v1, 0xf

    .line 5
    .line 6
    :goto_0
    const/4 v2, 0x0

    .line 7
    if-ltz v1, :cond_0

    .line 8
    .line 9
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/gcm/Tables64kGCMMultiplier;->M:[[[I

    .line 10
    .line 11
    aget-object v3, v3, v1

    .line 12
    .line 13
    aget-byte v4, p1, v1

    .line 14
    .line 15
    and-int/lit16 v4, v4, 0xff

    .line 16
    .line 17
    aget-object v3, v3, v4

    .line 18
    .line 19
    aget v4, v0, v2

    .line 20
    .line 21
    aget v5, v3, v2

    .line 22
    .line 23
    xor-int/2addr v4, v5

    .line 24
    aput v4, v0, v2

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    aget v4, v0, v2

    .line 28
    .line 29
    aget v5, v3, v2

    .line 30
    .line 31
    xor-int/2addr v4, v5

    .line 32
    aput v4, v0, v2

    .line 33
    .line 34
    const/4 v2, 0x2

    .line 35
    aget v4, v0, v2

    .line 36
    .line 37
    aget v5, v3, v2

    .line 38
    .line 39
    xor-int/2addr v4, v5

    .line 40
    aput v4, v0, v2

    .line 41
    .line 42
    const/4 v2, 0x3

    .line 43
    aget v4, v0, v2

    .line 44
    .line 45
    aget v3, v3, v2

    .line 46
    .line 47
    xor-int/2addr v3, v4

    .line 48
    aput v3, v0, v2

    .line 49
    .line 50
    add-int/lit8 v1, v1, -0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-static {v0, p1, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian([I[BI)V

    .line 54
    .line 55
    .line 56
    return-void
.end method
