.class public Ll/xi20;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a([B[B[B)Lcom/p1/mobile/putong/api/api/NKResult;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    .line 2
    .line 3
    new-instance v1, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 4
    .line 5
    new-instance v2, Lorg/spongycastle/crypto/engines/AESFastEngine;

    .line 6
    .line 7
    invoke-direct {v2}, Lorg/spongycastle/crypto/engines/AESFastEngine;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 17
    .line 18
    new-instance v2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v1, v2, p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    invoke-virtual {v0, p0, v1}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 28
    .line 29
    .line 30
    array-length p0, p1

    .line 31
    invoke-virtual {v0, p0}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->getOutputSize(I)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    new-array v4, p0, [B

    .line 36
    .line 37
    array-length v3, p1

    .line 38
    const/4 v5, 0x0

    .line 39
    const/4 v2, 0x0

    .line 40
    move-object v1, p1

    .line 41
    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->processBytes([BII[BI)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {v0, v4, p0}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->doFinal([BI)I

    .line 46
    .line 47
    .line 48
    new-instance p0, Lcom/p1/mobile/putong/api/api/NKResult;

    .line 49
    .line 50
    invoke-direct {p0, v4, p2}, Lcom/p1/mobile/putong/api/api/NKResult;-><init>([B[B)V

    .line 51
    .line 52
    .line 53
    return-object p0
.end method
