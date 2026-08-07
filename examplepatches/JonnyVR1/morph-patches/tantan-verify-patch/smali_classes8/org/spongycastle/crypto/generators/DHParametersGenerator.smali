.class public Lorg/spongycastle/crypto/generators/DHParametersGenerator;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TWO:Ljava/math/BigInteger;


# instance fields
.field private certainty:I

.field private random:Ljava/security/SecureRandom;

.field private size:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x2

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/spongycastle/crypto/generators/DHParametersGenerator;->TWO:Ljava/math/BigInteger;

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


# virtual methods
.method public generateParameters()Lorg/spongycastle/crypto/params/DHParameters;
    .locals 8

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/generators/DHParametersGenerator;->size:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/generators/DHParametersGenerator;->certainty:I

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/generators/DHParametersGenerator;->random:Ljava/security/SecureRandom;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/generators/DHParametersHelper;->generateSafePrimes(IILjava/security/SecureRandom;)[Ljava/math/BigInteger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    aget-object v3, v0, v1

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    aget-object v5, v0, v1

    .line 16
    .line 17
    iget-object p0, p0, Lorg/spongycastle/crypto/generators/DHParametersGenerator;->random:Ljava/security/SecureRandom;

    .line 18
    .line 19
    invoke-static {v3, v5, p0}, Lorg/spongycastle/crypto/generators/DHParametersHelper;->selectGenerator(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    new-instance v2, Lorg/spongycastle/crypto/params/DHParameters;

    .line 24
    .line 25
    sget-object v6, Lorg/spongycastle/crypto/generators/DHParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 26
    .line 27
    const/4 v7, 0x0

    .line 28
    invoke-direct/range {v2 .. v7}, Lorg/spongycastle/crypto/params/DHParameters;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/spongycastle/crypto/params/DHValidationParameters;)V

    .line 29
    .line 30
    .line 31
    return-object v2
.end method

.method public init(IILjava/security/SecureRandom;)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/spongycastle/crypto/generators/DHParametersGenerator;->size:I

    .line 2
    .line 3
    iput p2, p0, Lorg/spongycastle/crypto/generators/DHParametersGenerator;->certainty:I

    .line 4
    .line 5
    iput-object p3, p0, Lorg/spongycastle/crypto/generators/DHParametersGenerator;->random:Ljava/security/SecureRandom;

    .line 6
    .line 7
    return-void
.end method
