.class public Lorg/spongycastle/math/Primes$STOutput;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/math/Primes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "STOutput"
.end annotation


# instance fields
.field private prime:Ljava/math/BigInteger;

.field private primeGenCounter:I

.field private primeSeed:[B


# direct methods
.method private constructor <init>(Ljava/math/BigInteger;[BI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/math/Primes$STOutput;->prime:Ljava/math/BigInteger;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/spongycastle/math/Primes$STOutput;->primeSeed:[B

    .line 7
    .line 8
    iput p3, p0, Lorg/spongycastle/math/Primes$STOutput;->primeGenCounter:I

    .line 9
    .line 10
    return-void
.end method

.method public synthetic constructor <init>(Ljava/math/BigInteger;[BILorg/spongycastle/math/Primes$1;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/math/Primes$STOutput;-><init>(Ljava/math/BigInteger;[BI)V

    return-void
.end method


# virtual methods
.method public getPrime()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/Primes$STOutput;->prime:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPrimeGenCounter()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/math/Primes$STOutput;->primeGenCounter:I

    .line 2
    .line 3
    return p0
.end method

.method public getPrimeSeed()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/Primes$STOutput;->primeSeed:[B

    .line 2
    .line 3
    return-object p0
.end method
