.class public Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final beta:Ljava/math/BigInteger;

.field protected final bits:I

.field protected final g1:Ljava/math/BigInteger;

.field protected final g2:Ljava/math/BigInteger;

.field protected final lambda:Ljava/math/BigInteger;

.field protected final v1A:Ljava/math/BigInteger;

.field protected final v1B:Ljava/math/BigInteger;

.field protected final v2A:Ljava/math/BigInteger;

.field protected final v2B:Ljava/math/BigInteger;


# direct methods
.method public constructor <init>(Ljava/math/BigInteger;Ljava/math/BigInteger;[Ljava/math/BigInteger;[Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "v1"

    .line 5
    .line 6
    invoke-static {p3, v0}, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->checkVector([Ljava/math/BigInteger;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "v2"

    .line 10
    .line 11
    invoke-static {p4, v0}, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->checkVector([Ljava/math/BigInteger;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->beta:Ljava/math/BigInteger;

    .line 15
    .line 16
    iput-object p2, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->lambda:Ljava/math/BigInteger;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    aget-object p2, p3, p1

    .line 20
    .line 21
    iput-object p2, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->v1A:Ljava/math/BigInteger;

    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    aget-object p3, p3, p2

    .line 25
    .line 26
    iput-object p3, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->v1B:Ljava/math/BigInteger;

    .line 27
    .line 28
    aget-object p1, p4, p1

    .line 29
    .line 30
    iput-object p1, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->v2A:Ljava/math/BigInteger;

    .line 31
    .line 32
    aget-object p1, p4, p2

    .line 33
    .line 34
    iput-object p1, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->v2B:Ljava/math/BigInteger;

    .line 35
    .line 36
    iput-object p5, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->g1:Ljava/math/BigInteger;

    .line 37
    .line 38
    iput-object p6, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->g2:Ljava/math/BigInteger;

    .line 39
    .line 40
    iput p7, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->bits:I

    .line 41
    .line 42
    return-void
.end method

.method private static checkVector([Ljava/math/BigInteger;Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x2

    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    aget-object v0, p0, v0

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    aget-object p0, p0, v0

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string p0, "\'"

    .line 19
    .line 20
    const-string v0, "\' must consist of exactly 2 (non-null) values"

    .line 21
    .line 22
    invoke-static {p0, p1, v0}, Ll/v1d0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public getBeta()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->beta:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBits()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->bits:I

    .line 2
    .line 3
    return p0
.end method

.method public getG1()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->g1:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getG2()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->g2:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLambda()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->lambda:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getV1()[Ljava/math/BigInteger;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->v1A:Ljava/math/BigInteger;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->v1B:Ljava/math/BigInteger;

    .line 4
    .line 5
    filled-new-array {v0, p0}, [Ljava/math/BigInteger;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getV1A()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->v1A:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getV1B()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->v1B:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getV2()[Ljava/math/BigInteger;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->v2A:Ljava/math/BigInteger;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->v2B:Ljava/math/BigInteger;

    .line 4
    .line 5
    filled-new-array {v0, p0}, [Ljava/math/BigInteger;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getV2A()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->v2A:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getV2B()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;->v2B:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method
