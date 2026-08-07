.class public Lorg/spongycastle/crypto/engines/RSABlindedEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/AsymmetricBlockCipher;


# static fields
.field private static final ONE:Ljava/math/BigInteger;


# instance fields
.field private core:Lorg/spongycastle/crypto/engines/RSACoreEngine;

.field private key:Lorg/spongycastle/crypto/params/RSAKeyParameters;

.field private random:Ljava/security/SecureRandom;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->ONE:Ljava/math/BigInteger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/crypto/engines/RSACoreEngine;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/spongycastle/crypto/engines/RSACoreEngine;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->core:Lorg/spongycastle/crypto/engines/RSACoreEngine;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getInputBlockSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->core:Lorg/spongycastle/crypto/engines/RSACoreEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/RSACoreEngine;->getInputBlockSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getOutputBlockSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->core:Lorg/spongycastle/crypto/engines/RSACoreEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/RSACoreEngine;->getOutputBlockSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->core:Lorg/spongycastle/crypto/engines/RSACoreEngine;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lorg/spongycastle/crypto/engines/RSACoreEngine;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 4
    .line 5
    .line 6
    instance-of p1, p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 11
    .line 12
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 17
    .line 18
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->key:Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 19
    .line 20
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getRandom()Ljava/security/SecureRandom;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->random:Ljava/security/SecureRandom;

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    check-cast p2, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 28
    .line 29
    iput-object p2, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->key:Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 30
    .line 31
    new-instance p1, Ljava/security/SecureRandom;

    .line 32
    .line 33
    invoke-direct {p1}, Ljava/security/SecureRandom;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->random:Ljava/security/SecureRandom;

    .line 37
    .line 38
    return-void
.end method

.method public processBlock([BII)[B
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->key:Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->core:Lorg/spongycastle/crypto/engines/RSACoreEngine;

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2, p3}, Lorg/spongycastle/crypto/engines/RSACoreEngine;->convertInput([BII)Ljava/math/BigInteger;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->key:Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 13
    .line 14
    instance-of p3, p2, Lorg/spongycastle/crypto/params/RSAPrivateCrtKeyParameters;

    .line 15
    .line 16
    if-eqz p3, :cond_2

    .line 17
    .line 18
    check-cast p2, Lorg/spongycastle/crypto/params/RSAPrivateCrtKeyParameters;

    .line 19
    .line 20
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/RSAPrivateCrtKeyParameters;->getPublicExponent()Ljava/math/BigInteger;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    if-eqz p3, :cond_1

    .line 25
    .line 26
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/RSAKeyParameters;->getModulus()Ljava/math/BigInteger;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    sget-object v0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->ONE:Ljava/math/BigInteger;

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->random:Ljava/security/SecureRandom;

    .line 37
    .line 38
    invoke-static {v0, v2, v3}, Lorg/spongycastle/util/BigIntegers;->createRandomInRange(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, p3, p2}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2, p1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2, p2}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->core:Lorg/spongycastle/crypto/engines/RSACoreEngine;

    .line 55
    .line 56
    invoke-virtual {v3, v2}, Lorg/spongycastle/crypto/engines/RSACoreEngine;->processBlock(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v0, p2}, Ljava/math/BigInteger;->modInverse(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v2, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0, p2}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0, p3, p2}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-virtual {p1, p2}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_0

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    const-string p0, "RSA engine faulty decryption/signing detected"

    .line 84
    .line 85
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-object v1

    .line 89
    :cond_1
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->core:Lorg/spongycastle/crypto/engines/RSACoreEngine;

    .line 90
    .line 91
    invoke-virtual {p2, p1}, Lorg/spongycastle/crypto/engines/RSACoreEngine;->processBlock(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    goto :goto_0

    .line 96
    :cond_2
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->core:Lorg/spongycastle/crypto/engines/RSACoreEngine;

    .line 97
    .line 98
    invoke-virtual {p2, p1}, Lorg/spongycastle/crypto/engines/RSACoreEngine;->processBlock(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    :goto_0
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/RSABlindedEngine;->core:Lorg/spongycastle/crypto/engines/RSACoreEngine;

    .line 103
    .line 104
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/engines/RSACoreEngine;->convertOutput(Ljava/math/BigInteger;)[B

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0

    .line 109
    :cond_3
    const-string p0, "RSA engine not initialised"

    .line 110
    .line 111
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-object v1
.end method
