.class public Lorg/spongycastle/crypto/engines/DESedeEngine;
.super Lorg/spongycastle/crypto/engines/DESEngine;
.source "SourceFile"


# static fields
.field protected static final BLOCK_SIZE:I = 0x8


# instance fields
.field private forEncryption:Z

.field private workingKey1:[I

.field private workingKey2:[I

.field private workingKey3:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/DESEngine;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey1:[I

    .line 6
    .line 7
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey2:[I

    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey3:[I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "DESede"

    .line 2
    .line 3
    return-object p0
.end method

.method public getBlockSize()I
    .locals 0

    const/16 p0, 0x8

    return p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 6

    .line 1
    instance-of v0, p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 6
    .line 7
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    array-length v0, p2

    .line 12
    const/16 v1, 0x10

    .line 13
    .line 14
    const/16 v2, 0x18

    .line 15
    .line 16
    if-eq v0, v2, :cond_1

    .line 17
    .line 18
    array-length v0, p2

    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p0, "key size must be 16 or 24 bytes."

    .line 23
    .line 24
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    :goto_0
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->forEncryption:Z

    .line 29
    .line 30
    const/16 v0, 0x8

    .line 31
    .line 32
    new-array v3, v0, [B

    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    invoke-static {p2, v4, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1, v3}, Lorg/spongycastle/crypto/engines/DESEngine;->generateWorkingKey(Z[B)[I

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iput-object v3, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey1:[I

    .line 43
    .line 44
    new-array v3, v0, [B

    .line 45
    .line 46
    invoke-static {p2, v0, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 47
    .line 48
    .line 49
    xor-int/lit8 v5, p1, 0x1

    .line 50
    .line 51
    invoke-virtual {p0, v5, v3}, Lorg/spongycastle/crypto/engines/DESEngine;->generateWorkingKey(Z[B)[I

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    iput-object v3, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey2:[I

    .line 56
    .line 57
    array-length v3, p2

    .line 58
    if-ne v3, v2, :cond_2

    .line 59
    .line 60
    new-array v2, v0, [B

    .line 61
    .line 62
    invoke-static {p2, v1, v2, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1, v2}, Lorg/spongycastle/crypto/engines/DESEngine;->generateWorkingKey(Z[B)[I

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey3:[I

    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey1:[I

    .line 73
    .line 74
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey3:[I

    .line 75
    .line 76
    return-void

    .line 77
    :cond_3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const-string p1, "invalid parameter passed to DESede init - "

    .line 86
    .line 87
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public processBlock([BI[BI)I
    .locals 7

    .line 1
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey1:[I

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    if-eqz v1, :cond_3

    .line 5
    .line 6
    add-int/lit8 v3, p2, 0x8

    .line 7
    .line 8
    array-length v5, p1

    .line 9
    if-gt v3, v5, :cond_2

    .line 10
    .line 11
    add-int/lit8 v3, p4, 0x8

    .line 12
    .line 13
    array-length v5, p3

    .line 14
    if-gt v3, v5, :cond_1

    .line 15
    .line 16
    const/16 v6, 0x8

    .line 17
    .line 18
    new-array v2, v6, [B

    .line 19
    .line 20
    iget-boolean v3, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->forEncryption:Z

    .line 21
    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    move-object v0, p0

    .line 26
    move v3, p2

    .line 27
    move-object v4, v2

    .line 28
    move-object v2, p1

    .line 29
    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/engines/DESEngine;->desFunc([I[BI[BI)V

    .line 30
    .line 31
    .line 32
    move-object v2, v4

    .line 33
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey2:[I

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/engines/DESEngine;->desFunc([I[BI[BI)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey3:[I

    .line 40
    .line 41
    move-object v4, p3

    .line 42
    move v5, p4

    .line 43
    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/engines/DESEngine;->desFunc([I[BI[BI)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey3:[I

    .line 48
    .line 49
    const/4 v5, 0x0

    .line 50
    move-object v0, p0

    .line 51
    move v3, p2

    .line 52
    move-object v4, v2

    .line 53
    move-object v2, p1

    .line 54
    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/engines/DESEngine;->desFunc([I[BI[BI)V

    .line 55
    .line 56
    .line 57
    move-object v2, v4

    .line 58
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey2:[I

    .line 59
    .line 60
    const/4 v3, 0x0

    .line 61
    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/engines/DESEngine;->desFunc([I[BI[BI)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/DESedeEngine;->workingKey1:[I

    .line 65
    .line 66
    move-object v4, p3

    .line 67
    move v5, p4

    .line 68
    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/engines/DESEngine;->desFunc([I[BI[BI)V

    .line 69
    .line 70
    .line 71
    :goto_0
    return v6

    .line 72
    :cond_1
    const-string v0, "output buffer too short"

    .line 73
    .line 74
    invoke-static {v0}, Ll/g;->a(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return v2

    .line 78
    :cond_2
    const-string v0, "input buffer too short"

    .line 79
    .line 80
    invoke-static {v0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return v2

    .line 84
    :cond_3
    const-string v0, "DESede engine not initialised"

    .line 85
    .line 86
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return v2
.end method

.method public reset()V
    .locals 0

    return-void
.end method
