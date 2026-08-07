.class public Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator$ParametersHelper;
    }
.end annotation


# static fields
.field private static final ONE:Ljava/math/BigInteger;


# instance fields
.field private certainty:I

.field private random:Ljava/security/SecureRandom;

.field private size:I


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
    sput-object v0, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000()Ljava/math/BigInteger;
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public generateParameters()Lorg/spongycastle/crypto/params/CramerShoupParameters;
    .locals 4

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;->size:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;->certainty:I

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;->random:Ljava/security/SecureRandom;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator$ParametersHelper;->generateSafePrimes(IILjava/security/SecureRandom;)[Ljava/math/BigInteger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    aget-object v0, v0, v1

    .line 13
    .line 14
    iget-object v1, p0, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;->random:Ljava/security/SecureRandom;

    .line 15
    .line 16
    invoke-static {v0, v1}, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator$ParametersHelper;->selectGenerator(Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;->random:Ljava/security/SecureRandom;

    .line 21
    .line 22
    invoke-static {v0, v2}, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator$ParametersHelper;->selectGenerator(Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    :goto_0
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_0

    .line 31
    .line 32
    iget-object v2, p0, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;->random:Ljava/security/SecureRandom;

    .line 33
    .line 34
    invoke-static {v0, v2}, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator$ParametersHelper;->selectGenerator(Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    new-instance p0, Lorg/spongycastle/crypto/params/CramerShoupParameters;

    .line 40
    .line 41
    new-instance v3, Lorg/spongycastle/crypto/digests/SHA256Digest;

    .line 42
    .line 43
    invoke-direct {v3}, Lorg/spongycastle/crypto/digests/SHA256Digest;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0, v0, v1, v2, v3}, Lorg/spongycastle/crypto/params/CramerShoupParameters;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/spongycastle/crypto/Digest;)V

    .line 47
    .line 48
    .line 49
    return-object p0
.end method

.method public generateParameters(Lorg/spongycastle/crypto/params/DHParameters;)Lorg/spongycastle/crypto/params/CramerShoupParameters;
    .locals 3

    .line 50
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/DHParameters;->getP()Ljava/math/BigInteger;

    move-result-object v0

    .line 51
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/DHParameters;->getG()Ljava/math/BigInteger;

    move-result-object p1

    .line 52
    iget-object v1, p0, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;->random:Ljava/security/SecureRandom;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator$ParametersHelper;->selectGenerator(Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    move-result-object v1

    .line 53
    :goto_0
    invoke-virtual {p1, v1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 54
    iget-object v1, p0, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;->random:Ljava/security/SecureRandom;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator$ParametersHelper;->selectGenerator(Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    move-result-object v1

    goto :goto_0

    .line 55
    :cond_0
    new-instance p0, Lorg/spongycastle/crypto/params/CramerShoupParameters;

    new-instance v2, Lorg/spongycastle/crypto/digests/SHA256Digest;

    invoke-direct {v2}, Lorg/spongycastle/crypto/digests/SHA256Digest;-><init>()V

    invoke-direct {p0, v0, p1, v1, v2}, Lorg/spongycastle/crypto/params/CramerShoupParameters;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/spongycastle/crypto/Digest;)V

    return-object p0
.end method

.method public init(IILjava/security/SecureRandom;)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;->size:I

    .line 2
    .line 3
    iput p2, p0, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;->certainty:I

    .line 4
    .line 5
    iput-object p3, p0, Lorg/spongycastle/crypto/generators/CramerShoupParametersGenerator;->random:Ljava/security/SecureRandom;

    .line 6
    .line 7
    return-void
.end method
