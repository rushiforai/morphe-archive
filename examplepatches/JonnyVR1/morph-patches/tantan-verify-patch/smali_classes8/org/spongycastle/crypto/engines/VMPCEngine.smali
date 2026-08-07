.class public Lorg/spongycastle/crypto/engines/VMPCEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/StreamCipher;


# instance fields
.field protected P:[B

.field protected n:B

.field protected s:B

.field protected workingIV:[B

.field protected workingKey:[B


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-byte v0, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->n:B

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->P:[B

    .line 9
    .line 10
    iput-byte v0, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "VMPC"

    .line 2
    .line 3
    return-object p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 2

    .line 1
    instance-of p1, p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 6
    .line 7
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    instance-of p1, p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 20
    .line 21
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iput-object p2, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->workingIV:[B

    .line 26
    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    array-length v0, p2

    .line 30
    const/4 v1, 0x1

    .line 31
    if-lt v0, v1, :cond_0

    .line 32
    .line 33
    array-length p2, p2

    .line 34
    const/16 v0, 0x300

    .line 35
    .line 36
    if-gt p2, v0, :cond_0

    .line 37
    .line 38
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->workingKey:[B

    .line 43
    .line 44
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->workingIV:[B

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2}, Lorg/spongycastle/crypto/engines/VMPCEngine;->initKey([B[B)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    const-string p0, "VMPC requires 1 to 768 bytes of IV"

    .line 51
    .line 52
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    const-string p0, "VMPC init parameters must include a key"

    .line 57
    .line 58
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    const-string p0, "VMPC init parameters must include an IV"

    .line 63
    .line 64
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public initKey([B[B)V
    .locals 7

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
    move p1, v0

    .line 61
    :goto_2
    if-ge p1, v2, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->P:[B

    .line 64
    .line 65
    iget-byte v3, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 66
    .line 67
    and-int/lit16 v4, p1, 0xff

    .line 68
    .line 69
    aget-byte v5, v1, v4

    .line 70
    .line 71
    add-int/2addr v3, v5

    .line 72
    array-length v6, p2

    .line 73
    rem-int v6, p1, v6

    .line 74
    .line 75
    aget-byte v6, p2, v6

    .line 76
    .line 77
    add-int/2addr v3, v6

    .line 78
    and-int/lit16 v3, v3, 0xff

    .line 79
    .line 80
    aget-byte v3, v1, v3

    .line 81
    .line 82
    iput-byte v3, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 83
    .line 84
    and-int/lit16 v6, v3, 0xff

    .line 85
    .line 86
    aget-byte v6, v1, v6

    .line 87
    .line 88
    aput-byte v6, v1, v4

    .line 89
    .line 90
    and-int/lit16 v3, v3, 0xff

    .line 91
    .line 92
    aput-byte v5, v1, v3

    .line 93
    .line 94
    add-int/lit8 p1, p1, 0x1

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_2
    iput-byte v0, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->n:B

    .line 98
    .line 99
    return-void
.end method

.method public processBytes([BII[BI)I
    .locals 8

    .line 1
    add-int v0, p2, p3

    .line 2
    .line 3
    array-length v1, p1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-gt v0, v1, :cond_2

    .line 6
    .line 7
    add-int v0, p5, p3

    .line 8
    .line 9
    array-length v1, p4

    .line 10
    if-gt v0, v1, :cond_1

    .line 11
    .line 12
    :goto_0
    if-ge v2, p3, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->P:[B

    .line 15
    .line 16
    iget-byte v1, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 17
    .line 18
    iget-byte v3, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->n:B

    .line 19
    .line 20
    and-int/lit16 v4, v3, 0xff

    .line 21
    .line 22
    aget-byte v4, v0, v4

    .line 23
    .line 24
    add-int/2addr v1, v4

    .line 25
    and-int/lit16 v1, v1, 0xff

    .line 26
    .line 27
    aget-byte v1, v0, v1

    .line 28
    .line 29
    iput-byte v1, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 30
    .line 31
    and-int/lit16 v4, v1, 0xff

    .line 32
    .line 33
    aget-byte v4, v0, v4

    .line 34
    .line 35
    and-int/lit16 v4, v4, 0xff

    .line 36
    .line 37
    aget-byte v4, v0, v4

    .line 38
    .line 39
    add-int/lit8 v4, v4, 0x1

    .line 40
    .line 41
    and-int/lit16 v4, v4, 0xff

    .line 42
    .line 43
    aget-byte v4, v0, v4

    .line 44
    .line 45
    and-int/lit16 v5, v3, 0xff

    .line 46
    .line 47
    aget-byte v5, v0, v5

    .line 48
    .line 49
    and-int/lit16 v6, v3, 0xff

    .line 50
    .line 51
    and-int/lit16 v7, v1, 0xff

    .line 52
    .line 53
    aget-byte v7, v0, v7

    .line 54
    .line 55
    aput-byte v7, v0, v6

    .line 56
    .line 57
    and-int/lit16 v1, v1, 0xff

    .line 58
    .line 59
    aput-byte v5, v0, v1

    .line 60
    .line 61
    add-int/lit8 v3, v3, 0x1

    .line 62
    .line 63
    and-int/lit16 v0, v3, 0xff

    .line 64
    .line 65
    int-to-byte v0, v0

    .line 66
    iput-byte v0, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->n:B

    .line 67
    .line 68
    add-int v0, v2, p5

    .line 69
    .line 70
    add-int v1, v2, p2

    .line 71
    .line 72
    aget-byte v1, p1, v1

    .line 73
    .line 74
    xor-int/2addr v1, v4

    .line 75
    int-to-byte v1, v1

    .line 76
    aput-byte v1, p4, v0

    .line 77
    .line 78
    add-int/lit8 v2, v2, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    return p3

    .line 82
    :cond_1
    const-string p0, "output buffer too short"

    .line 83
    .line 84
    invoke-static {p0}, Ll/g;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return v2

    .line 88
    :cond_2
    const-string p0, "input buffer too short"

    .line 89
    .line 90
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return v2
.end method

.method public reset()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->workingKey:[B

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->workingIV:[B

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lorg/spongycastle/crypto/engines/VMPCEngine;->initKey([B[B)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public returnByte(B)B
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->P:[B

    .line 2
    .line 3
    iget-byte v1, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 4
    .line 5
    iget-byte v2, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->n:B

    .line 6
    .line 7
    and-int/lit16 v3, v2, 0xff

    .line 8
    .line 9
    aget-byte v3, v0, v3

    .line 10
    .line 11
    add-int/2addr v1, v3

    .line 12
    and-int/lit16 v1, v1, 0xff

    .line 13
    .line 14
    aget-byte v1, v0, v1

    .line 15
    .line 16
    iput-byte v1, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->s:B

    .line 17
    .line 18
    and-int/lit16 v3, v1, 0xff

    .line 19
    .line 20
    aget-byte v3, v0, v3

    .line 21
    .line 22
    and-int/lit16 v3, v3, 0xff

    .line 23
    .line 24
    aget-byte v3, v0, v3

    .line 25
    .line 26
    add-int/lit8 v3, v3, 0x1

    .line 27
    .line 28
    and-int/lit16 v3, v3, 0xff

    .line 29
    .line 30
    aget-byte v3, v0, v3

    .line 31
    .line 32
    and-int/lit16 v4, v2, 0xff

    .line 33
    .line 34
    aget-byte v4, v0, v4

    .line 35
    .line 36
    and-int/lit16 v5, v2, 0xff

    .line 37
    .line 38
    and-int/lit16 v6, v1, 0xff

    .line 39
    .line 40
    aget-byte v6, v0, v6

    .line 41
    .line 42
    aput-byte v6, v0, v5

    .line 43
    .line 44
    and-int/lit16 v1, v1, 0xff

    .line 45
    .line 46
    aput-byte v4, v0, v1

    .line 47
    .line 48
    add-int/lit8 v2, v2, 0x1

    .line 49
    .line 50
    and-int/lit16 v0, v2, 0xff

    .line 51
    .line 52
    int-to-byte v0, v0

    .line 53
    iput-byte v0, p0, Lorg/spongycastle/crypto/engines/VMPCEngine;->n:B

    .line 54
    .line 55
    xor-int p0, p1, v3

    .line 56
    .line 57
    int-to-byte p0, p0

    .line 58
    return p0
.end method
