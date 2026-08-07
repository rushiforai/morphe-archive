.class public Lorg/spongycastle/crypto/engines/NaccacheSternEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/AsymmetricBlockCipher;


# static fields
.field private static ONE:Ljava/math/BigInteger;

.field private static ZERO:Ljava/math/BigInteger;


# instance fields
.field private debug:Z

.field private forEncryption:Z

.field private key:Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;

.field private lookup:[Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->ZERO:Ljava/math/BigInteger;

    .line 8
    .line 9
    const-wide/16 v0, 0x1

    .line 10
    .line 11
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->ONE:Ljava/math/BigInteger;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->lookup:[Ljava/util/Vector;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 9
    .line 10
    return-void
.end method

.method private static chineseRemainder(Ljava/util/Vector;Ljava/util/Vector;)Ljava/math/BigInteger;
    .locals 5

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->ZERO:Ljava/math/BigInteger;

    .line 2
    .line 3
    sget-object v1, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->ONE:Ljava/math/BigInteger;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    move v3, v2

    .line 7
    :goto_0
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    .line 8
    .line 9
    .line 10
    move-result v4

    .line 11
    if-ge v3, v4, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    check-cast v4, Ljava/math/BigInteger;

    .line 18
    .line 19
    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    :goto_1
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-ge v2, v3, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Ljava/math/BigInteger;

    .line 37
    .line 38
    invoke-virtual {v1, v3}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v4, v3}, Ljava/math/BigInteger;->modInverse(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v4, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {p0, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    check-cast v4, Ljava/math/BigInteger;

    .line 55
    .line 56
    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v0, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    add-int/lit8 v2, v2, 0x1

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0
.end method


# virtual methods
.method public addCryptedBlocks([B[B)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->forEncryption:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "BlockLength too large for simple addition.\n"

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    array-length v0, p1

    .line 9
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->getOutputBlockSize()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-gt v0, v3, :cond_0

    .line 14
    .line 15
    array-length v0, p2

    .line 16
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->getOutputBlockSize()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-gt v0, v3, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-static {v2}, Ll/psl;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-object v1

    .line 27
    :cond_1
    array-length v0, p1

    .line 28
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->getInputBlockSize()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-gt v0, v3, :cond_3

    .line 33
    .line 34
    array-length v0, p2

    .line 35
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->getInputBlockSize()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-gt v0, v3, :cond_3

    .line 40
    .line 41
    :goto_0
    new-instance v0, Ljava/math/BigInteger;

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    invoke-direct {v0, v1, p1}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 45
    .line 46
    .line 47
    new-instance p1, Ljava/math/BigInteger;

    .line 48
    .line 49
    invoke-direct {p1, v1, p2}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->key:Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;

    .line 57
    .line 58
    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->getModulus()Ljava/math/BigInteger;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p2, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iget-boolean v1, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 67
    .line 68
    if-eqz v1, :cond_2

    .line 69
    .line 70
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 71
    .line 72
    new-instance v2, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v3, "c(m1) as BigInteger:....... "

    .line 75
    .line 76
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 90
    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v2, "c(m2) as BigInteger:....... "

    .line 94
    .line 95
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 109
    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string v1, "c(m1)*c(m2)%n = c(m1+m2)%n: "

    .line 113
    .line 114
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_2
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->key:Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;

    .line 128
    .line 129
    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->getModulus()Ljava/math/BigInteger;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p0}, Ljava/math/BigInteger;->toByteArray()[B

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    const/4 p1, 0x0

    .line 138
    invoke-static {p0, p1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p2}, Ljava/math/BigInteger;->toByteArray()[B

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    array-length v1, p0

    .line 146
    invoke-virtual {p2}, Ljava/math/BigInteger;->toByteArray()[B

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    array-length v2, v2

    .line 151
    sub-int/2addr v1, v2

    .line 152
    invoke-virtual {p2}, Ljava/math/BigInteger;->toByteArray()[B

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    array-length p2, p2

    .line 157
    invoke-static {v0, p1, p0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 158
    .line 159
    .line 160
    return-object p0

    .line 161
    :cond_3
    invoke-static {v2}, Ll/psl;->a(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    return-object v1
.end method

.method public encrypt(Ljava/math/BigInteger;)[B
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->key:Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->getModulus()Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->key:Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;

    .line 16
    .line 17
    invoke-virtual {v2}, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->getG()Ljava/math/BigInteger;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->key:Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;

    .line 22
    .line 23
    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->getModulus()Ljava/math/BigInteger;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v2, p1, v3}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ljava/math/BigInteger;->toByteArray()[B

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    array-length v2, v0

    .line 36
    array-length v3, p1

    .line 37
    sub-int/2addr v2, v3

    .line 38
    array-length v3, p1

    .line 39
    invoke-static {p1, v1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 40
    .line 41
    .line 42
    iget-boolean p0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 43
    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 47
    .line 48
    new-instance p1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v1, "Encrypted value is:  "

    .line 51
    .line 52
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    new-instance v1, Ljava/math/BigInteger;

    .line 56
    .line 57
    invoke-direct {v1, v0}, Ljava/math/BigInteger;-><init>([B)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-object v0
.end method

.method public getInputBlockSize()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->forEncryption:Z

    .line 2
    .line 3
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->key:Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->getLowerSigmaBound()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/lit8 p0, p0, 0x7

    .line 12
    .line 13
    div-int/lit8 p0, p0, 0x8

    .line 14
    .line 15
    add-int/lit8 p0, p0, -0x1

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->getModulus()Ljava/math/BigInteger;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/math/BigInteger;->toByteArray()[B

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    array-length p0, p0

    .line 27
    return p0
.end method

.method public getOutputBlockSize()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->forEncryption:Z

    .line 2
    .line 3
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->key:Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->getModulus()Ljava/math/BigInteger;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/math/BigInteger;->toByteArray()[B

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    array-length p0, p0

    .line 16
    return p0

    .line 17
    :cond_0
    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->getLowerSigmaBound()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    add-int/lit8 p0, p0, 0x7

    .line 22
    .line 23
    div-int/lit8 p0, p0, 0x8

    .line 24
    .line 25
    add-int/lit8 p0, p0, -0x1

    .line 26
    .line 27
    return p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 9

    .line 1
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->forEncryption:Z

    .line 2
    .line 3
    instance-of p1, p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 8
    .line 9
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    :cond_0
    check-cast p2, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;

    .line 14
    .line 15
    iput-object p2, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->key:Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;

    .line 16
    .line 17
    iget-boolean p1, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->forEncryption:Z

    .line 18
    .line 19
    if-nez p1, :cond_4

    .line 20
    .line 21
    iget-boolean p1, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 26
    .line 27
    const-string p2, "Constructing lookup Array"

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->key:Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;

    .line 33
    .line 34
    check-cast p1, Lorg/spongycastle/crypto/params/NaccacheSternPrivateKeyParameters;

    .line 35
    .line 36
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/NaccacheSternPrivateKeyParameters;->getSmallPrimes()Ljava/util/Vector;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p2}, Ljava/util/Vector;->size()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    new-array v0, v0, [Ljava/util/Vector;

    .line 45
    .line 46
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->lookup:[Ljava/util/Vector;

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    :goto_0
    invoke-virtual {p2}, Ljava/util/Vector;->size()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-ge v0, v1, :cond_4

    .line 54
    .line 55
    invoke-virtual {p2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Ljava/math/BigInteger;

    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/math/BigInteger;->intValue()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->lookup:[Ljava/util/Vector;

    .line 66
    .line 67
    new-instance v4, Ljava/util/Vector;

    .line 68
    .line 69
    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 70
    .line 71
    .line 72
    aput-object v4, v3, v0

    .line 73
    .line 74
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->lookup:[Ljava/util/Vector;

    .line 75
    .line 76
    aget-object v3, v3, v0

    .line 77
    .line 78
    sget-object v4, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->ONE:Ljava/math/BigInteger;

    .line 79
    .line 80
    invoke-virtual {v3, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    iget-boolean v3, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 84
    .line 85
    if-eqz v3, :cond_2

    .line 86
    .line 87
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 88
    .line 89
    new-instance v4, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string v5, "Constructing lookup ArrayList for "

    .line 92
    .line 93
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_2
    sget-object v3, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->ZERO:Ljava/math/BigInteger;

    .line 107
    .line 108
    const/4 v4, 0x1

    .line 109
    :goto_1
    if-ge v4, v2, :cond_3

    .line 110
    .line 111
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/NaccacheSternPrivateKeyParameters;->getPhi_n()Ljava/math/BigInteger;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    invoke-virtual {v3, v5}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    invoke-virtual {v3, v1}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->lookup:[Ljava/util/Vector;

    .line 124
    .line 125
    aget-object v6, v6, v0

    .line 126
    .line 127
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->getG()Ljava/math/BigInteger;

    .line 128
    .line 129
    .line 130
    move-result-object v7

    .line 131
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->getModulus()Ljava/math/BigInteger;

    .line 132
    .line 133
    .line 134
    move-result-object v8

    .line 135
    invoke-virtual {v7, v5, v8}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    invoke-virtual {v6, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    add-int/lit8 v4, v4, 0x1

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_4
    return-void
.end method

.method public processBlock([BII)[B
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->key:Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_c

    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->getInputBlockSize()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v2, 0x1

    .line 11
    add-int/2addr v0, v2

    .line 12
    if-gt p3, v0, :cond_b

    .line 13
    .line 14
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->forEncryption:Z

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->getInputBlockSize()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-lt p3, v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string p0, "BlockLength does not match modulus for Naccache-Stern cipher.\n"

    .line 26
    .line 27
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-object v1

    .line 31
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 32
    if-nez p2, :cond_2

    .line 33
    .line 34
    array-length v3, p1

    .line 35
    if-eq p3, v3, :cond_3

    .line 36
    .line 37
    :cond_2
    new-array v3, p3, [B

    .line 38
    .line 39
    invoke-static {p1, p2, v3, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 40
    .line 41
    .line 42
    move-object p1, v3

    .line 43
    :cond_3
    new-instance p2, Ljava/math/BigInteger;

    .line 44
    .line 45
    invoke-direct {p2, v2, p1}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 46
    .line 47
    .line 48
    iget-boolean p1, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 49
    .line 50
    if-eqz p1, :cond_4

    .line 51
    .line 52
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 53
    .line 54
    new-instance p3, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v2, "input as BigInteger: "

    .line 57
    .line 58
    invoke-direct {p3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    invoke-virtual {p1, p3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_4
    iget-boolean p1, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->forEncryption:Z

    .line 72
    .line 73
    if-eqz p1, :cond_5

    .line 74
    .line 75
    invoke-virtual {p0, p2}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->encrypt(Ljava/math/BigInteger;)[B

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0

    .line 80
    :cond_5
    new-instance p1, Ljava/util/Vector;

    .line 81
    .line 82
    invoke-direct {p1}, Ljava/util/Vector;-><init>()V

    .line 83
    .line 84
    .line 85
    iget-object p3, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->key:Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;

    .line 86
    .line 87
    check-cast p3, Lorg/spongycastle/crypto/params/NaccacheSternPrivateKeyParameters;

    .line 88
    .line 89
    invoke-virtual {p3}, Lorg/spongycastle/crypto/params/NaccacheSternPrivateKeyParameters;->getSmallPrimes()Ljava/util/Vector;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    move v3, v0

    .line 94
    :goto_1
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    if-ge v3, v4, :cond_a

    .line 99
    .line 100
    invoke-virtual {p3}, Lorg/spongycastle/crypto/params/NaccacheSternPrivateKeyParameters;->getPhi_n()Ljava/math/BigInteger;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    check-cast v5, Ljava/math/BigInteger;

    .line 109
    .line 110
    invoke-virtual {v4, v5}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-virtual {p3}, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->getModulus()Ljava/math/BigInteger;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    invoke-virtual {p2, v4, v5}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->lookup:[Ljava/util/Vector;

    .line 123
    .line 124
    aget-object v5, v5, v3

    .line 125
    .line 126
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    .line 127
    .line 128
    .line 129
    move-result v6

    .line 130
    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v7

    .line 134
    check-cast v7, Ljava/math/BigInteger;

    .line 135
    .line 136
    invoke-virtual {v7}, Ljava/math/BigInteger;->intValue()I

    .line 137
    .line 138
    .line 139
    move-result v7

    .line 140
    if-eq v6, v7, :cond_7

    .line 141
    .line 142
    iget-boolean p1, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 143
    .line 144
    if-eqz p1, :cond_6

    .line 145
    .line 146
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 147
    .line 148
    new-instance p2, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    const-string p3, "Prime is "

    .line 151
    .line 152
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object p3

    .line 159
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    const-string p3, ", lookup table has size "

    .line 163
    .line 164
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    .line 168
    .line 169
    .line 170
    move-result p3

    .line 171
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    invoke-virtual {p1, p2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    :cond_6
    new-instance p1, Lorg/spongycastle/crypto/InvalidCipherTextException;

    .line 182
    .line 183
    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    check-cast p2, Ljava/math/BigInteger;

    .line 188
    .line 189
    invoke-virtual {p2}, Ljava/math/BigInteger;->intValue()I

    .line 190
    .line 191
    .line 192
    move-result p2

    .line 193
    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object p3

    .line 197
    check-cast p3, Ljava/math/BigInteger;

    .line 198
    .line 199
    invoke-virtual {p3}, Ljava/math/BigInteger;->intValue()I

    .line 200
    .line 201
    .line 202
    move-result p3

    .line 203
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->lookup:[Ljava/util/Vector;

    .line 204
    .line 205
    aget-object p0, p0, v3

    .line 206
    .line 207
    invoke-virtual {p0}, Ljava/util/Vector;->size()I

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    new-instance v0, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    const-string v1, "Error in lookup Array for "

    .line 214
    .line 215
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    const-string p2, ": Size mismatch. Expected ArrayList with length "

    .line 222
    .line 223
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    const-string p2, " but found ArrayList of length "

    .line 230
    .line 231
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    invoke-direct {p1, p0}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    throw p1

    .line 245
    :cond_7
    invoke-virtual {v5, v4}, Ljava/util/Vector;->indexOf(Ljava/lang/Object;)I

    .line 246
    .line 247
    .line 248
    move-result v5

    .line 249
    const/4 v6, -0x1

    .line 250
    if-ne v5, v6, :cond_9

    .line 251
    .line 252
    iget-boolean p1, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 253
    .line 254
    if-eqz p1, :cond_8

    .line 255
    .line 256
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 257
    .line 258
    new-instance p2, Ljava/lang/StringBuilder;

    .line 259
    .line 260
    const-string p3, "Actual prime is "

    .line 261
    .line 262
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object p3

    .line 269
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object p2

    .line 276
    invoke-virtual {p1, p2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 280
    .line 281
    new-instance p2, Ljava/lang/StringBuilder;

    .line 282
    .line 283
    const-string p3, "Decrypted value is "

    .line 284
    .line 285
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object p2

    .line 295
    invoke-virtual {p1, p2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 299
    .line 300
    new-instance p2, Ljava/lang/StringBuilder;

    .line 301
    .line 302
    const-string p3, "LookupList for "

    .line 303
    .line 304
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object p3

    .line 311
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    const-string p3, " with size "

    .line 315
    .line 316
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    iget-object p3, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->lookup:[Ljava/util/Vector;

    .line 320
    .line 321
    aget-object p3, p3, v3

    .line 322
    .line 323
    invoke-virtual {p3}, Ljava/util/Vector;->size()I

    .line 324
    .line 325
    .line 326
    move-result p3

    .line 327
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    const-string p3, " is: "

    .line 331
    .line 332
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object p2

    .line 339
    invoke-virtual {p1, p2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    :goto_2
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->lookup:[Ljava/util/Vector;

    .line 343
    .line 344
    aget-object p1, p1, v3

    .line 345
    .line 346
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    .line 347
    .line 348
    .line 349
    move-result p1

    .line 350
    if-ge v0, p1, :cond_8

    .line 351
    .line 352
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 353
    .line 354
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->lookup:[Ljava/util/Vector;

    .line 355
    .line 356
    aget-object p2, p2, v3

    .line 357
    .line 358
    invoke-virtual {p2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object p2

    .line 362
    invoke-virtual {p1, p2}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 363
    .line 364
    .line 365
    add-int/lit8 v0, v0, 0x1

    .line 366
    .line 367
    goto :goto_2

    .line 368
    :cond_8
    const-string p0, "Lookup failed"

    .line 369
    .line 370
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    return-object v1

    .line 374
    :cond_9
    int-to-long v4, v5

    .line 375
    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 376
    .line 377
    .line 378
    move-result-object v4

    .line 379
    invoke-virtual {p1, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 380
    .line 381
    .line 382
    add-int/lit8 v3, v3, 0x1

    .line 383
    .line 384
    goto/16 :goto_1

    .line 385
    .line 386
    :cond_a
    invoke-static {p1, v2}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->chineseRemainder(Ljava/util/Vector;Ljava/util/Vector;)Ljava/math/BigInteger;

    .line 387
    .line 388
    .line 389
    move-result-object p0

    .line 390
    invoke-virtual {p0}, Ljava/math/BigInteger;->toByteArray()[B

    .line 391
    .line 392
    .line 393
    move-result-object p0

    .line 394
    return-object p0

    .line 395
    :cond_b
    const-string p0, "input too large for Naccache-Stern cipher.\n"

    .line 396
    .line 397
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 398
    .line 399
    .line 400
    return-object v1

    .line 401
    :cond_c
    const-string p0, "NaccacheStern engine not initialised"

    .line 402
    .line 403
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 404
    .line 405
    .line 406
    return-object v1
.end method

.method public processData([B)[B
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 8
    .line 9
    .line 10
    :cond_0
    array-length v0, p1

    .line 11
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->getInputBlockSize()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-le v0, v1, :cond_8

    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->getInputBlockSize()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->getOutputBlockSize()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iget-boolean v3, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 27
    .line 28
    const-string v4, " bytes"

    .line 29
    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 33
    .line 34
    new-instance v5, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v6, "Input blocksize is:  "

    .line 37
    .line 38
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-virtual {v3, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 55
    .line 56
    new-instance v5, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v6, "Output blocksize is: "

    .line 59
    .line 60
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    invoke-virtual {v3, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 77
    .line 78
    new-instance v5, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string v6, "Data has length:.... "

    .line 81
    .line 82
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    array-length v6, p1

    .line 86
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    invoke-virtual {v3, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_1
    array-length v3, p1

    .line 100
    div-int/2addr v3, v0

    .line 101
    add-int/lit8 v3, v3, 0x1

    .line 102
    .line 103
    mul-int/2addr v3, v1

    .line 104
    new-array v1, v3, [B

    .line 105
    .line 106
    move v3, v2

    .line 107
    move v5, v3

    .line 108
    :goto_0
    array-length v6, p1

    .line 109
    if-ge v3, v6, :cond_6

    .line 110
    .line 111
    add-int v6, v3, v0

    .line 112
    .line 113
    array-length v7, p1

    .line 114
    if-ge v6, v7, :cond_2

    .line 115
    .line 116
    invoke-virtual {p0, p1, v3, v0}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->processBlock([BII)[B

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    move v10, v6

    .line 121
    move-object v6, v3

    .line 122
    move v3, v10

    .line 123
    goto :goto_1

    .line 124
    :cond_2
    array-length v6, p1

    .line 125
    sub-int/2addr v6, v3

    .line 126
    invoke-virtual {p0, p1, v3, v6}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->processBlock([BII)[B

    .line 127
    .line 128
    .line 129
    move-result-object v6

    .line 130
    array-length v7, p1

    .line 131
    sub-int/2addr v7, v3

    .line 132
    add-int/2addr v3, v7

    .line 133
    :goto_1
    iget-boolean v7, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 134
    .line 135
    if-eqz v7, :cond_3

    .line 136
    .line 137
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 138
    .line 139
    new-instance v8, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    const-string v9, "new datapos is "

    .line 142
    .line 143
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v8

    .line 153
    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    :cond_3
    if-eqz v6, :cond_4

    .line 157
    .line 158
    array-length v7, v6

    .line 159
    invoke-static {v6, v2, v1, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 160
    .line 161
    .line 162
    array-length v6, v6

    .line 163
    add-int/2addr v5, v6

    .line 164
    goto :goto_0

    .line 165
    :cond_4
    iget-boolean p0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 166
    .line 167
    const-string p1, "cipher returned null"

    .line 168
    .line 169
    if-eqz p0, :cond_5

    .line 170
    .line 171
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 172
    .line 173
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    :cond_5
    invoke-static {p1}, Ll/psl;->a(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    const/4 p0, 0x0

    .line 180
    return-object p0

    .line 181
    :cond_6
    new-array p1, v5, [B

    .line 182
    .line 183
    invoke-static {v1, v2, p1, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 184
    .line 185
    .line 186
    iget-boolean p0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 187
    .line 188
    if-eqz p0, :cond_7

    .line 189
    .line 190
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 191
    .line 192
    new-instance v0, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    const-string v1, "returning "

    .line 195
    .line 196
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    :cond_7
    return-object p1

    .line 213
    :cond_8
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 214
    .line 215
    if-eqz v0, :cond_9

    .line 216
    .line 217
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 218
    .line 219
    const-string v1, "data size is less then input block size, processing directly"

    .line 220
    .line 221
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    :cond_9
    array-length v0, p1

    .line 225
    invoke-virtual {p0, p1, v2, v0}, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->processBlock([BII)[B

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    return-object p0
.end method

.method public setDebug(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/NaccacheSternEngine;->debug:Z

    .line 2
    .line 3
    return-void
.end method
