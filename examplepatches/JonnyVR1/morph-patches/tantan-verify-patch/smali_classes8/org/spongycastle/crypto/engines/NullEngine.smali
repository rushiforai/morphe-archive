.class public Lorg/spongycastle/crypto/engines/NullEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# static fields
.field protected static final DEFAULT_BLOCK_SIZE:I = 0x1


# instance fields
.field private final blockSize:I

.field private initialised:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    .line 7
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/engines/NullEngine;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lorg/spongycastle/crypto/engines/NullEngine;->blockSize:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "Null"

    .line 2
    .line 3
    return-object p0
.end method

.method public getBlockSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/engines/NullEngine;->blockSize:I

    .line 2
    .line 3
    return p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/NullEngine;->initialised:Z

    .line 3
    .line 4
    return-void
.end method

.method public processBlock([BI[BI)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/NullEngine;->initialised:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    iget v0, p0, Lorg/spongycastle/crypto/engines/NullEngine;->blockSize:I

    .line 7
    .line 8
    add-int v2, p2, v0

    .line 9
    .line 10
    array-length v3, p1

    .line 11
    if-gt v2, v3, :cond_2

    .line 12
    .line 13
    add-int/2addr v0, p4

    .line 14
    array-length v2, p3

    .line 15
    if-gt v0, v2, :cond_1

    .line 16
    .line 17
    :goto_0
    iget v0, p0, Lorg/spongycastle/crypto/engines/NullEngine;->blockSize:I

    .line 18
    .line 19
    if-ge v1, v0, :cond_0

    .line 20
    .line 21
    add-int v0, p4, v1

    .line 22
    .line 23
    add-int v2, p2, v1

    .line 24
    .line 25
    aget-byte v2, p1, v2

    .line 26
    .line 27
    aput-byte v2, p3, v0

    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return v0

    .line 33
    :cond_1
    const-string p0, "output buffer too short"

    .line 34
    .line 35
    invoke-static {p0}, Ll/g;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return v1

    .line 39
    :cond_2
    const-string p0, "input buffer too short"

    .line 40
    .line 41
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return v1

    .line 45
    :cond_3
    const-string p0, "Null engine not initialised"

    .line 46
    .line 47
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return v1
.end method

.method public reset()V
    .locals 0

    return-void
.end method
