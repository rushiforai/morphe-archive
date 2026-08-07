.class public Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;
.super Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyParameters;
.source "SourceFile"


# instance fields
.field private A1inv:[[S

.field private A2inv:[[S

.field private b1:[S

.field private b2:[S

.field private layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

.field private vi:[I


# direct methods
.method public constructor <init>([[S[S[[S[S[I[Lorg/spongycastle/pqc/crypto/rainbow/Layer;)V
    .locals 3

    .line 1
    array-length v0, p5

    .line 2
    const/4 v1, 0x1

    .line 3
    sub-int/2addr v0, v1

    .line 4
    aget v0, p5, v0

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    aget v2, p5, v2

    .line 8
    .line 9
    sub-int/2addr v0, v2

    .line 10
    invoke-direct {p0, v1, v0}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyParameters;-><init>(ZI)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->A1inv:[[S

    .line 14
    .line 15
    iput-object p2, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->b1:[S

    .line 16
    .line 17
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->A2inv:[[S

    .line 18
    .line 19
    iput-object p4, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->b2:[S

    .line 20
    .line 21
    iput-object p5, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->vi:[I

    .line 22
    .line 23
    iput-object p6, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public getB1()[S
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->b1:[S

    .line 2
    .line 3
    return-object p0
.end method

.method public getB2()[S
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->b2:[S

    .line 2
    .line 3
    return-object p0
.end method

.method public getInvA1()[[S
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->A1inv:[[S

    .line 2
    .line 3
    return-object p0
.end method

.method public getInvA2()[[S
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->A2inv:[[S

    .line 2
    .line 3
    return-object p0
.end method

.method public getLayers()[Lorg/spongycastle/pqc/crypto/rainbow/Layer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVi()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->vi:[I

    .line 2
    .line 3
    return-object p0
.end method
