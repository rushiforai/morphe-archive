.class public Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private c:I

.field private cL:J

.field private x0:I

.field private x0L:J


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0:I

    .line 5
    .line 6
    iput p2, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->c:I

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(JJ)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-wide p1, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0L:J

    .line 11
    iput-wide p3, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->cL:J

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .line 1
    instance-of v0, p1, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;

    .line 8
    .line 9
    iget v0, p1, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->c:I

    .line 10
    .line 11
    iget v2, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->c:I

    .line 12
    .line 13
    if-eq v0, v2, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    iget v0, p1, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0:I

    .line 17
    .line 18
    iget v2, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0:I

    .line 19
    .line 20
    if-eq v0, v2, :cond_2

    .line 21
    .line 22
    return v1

    .line 23
    :cond_2
    iget-wide v2, p1, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->cL:J

    .line 24
    .line 25
    iget-wide v4, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->cL:J

    .line 26
    .line 27
    cmp-long v0, v2, v4

    .line 28
    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    return v1

    .line 32
    :cond_3
    iget-wide v2, p1, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0L:J

    .line 33
    .line 34
    iget-wide p0, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0L:J

    .line 35
    .line 36
    cmp-long p0, v2, p0

    .line 37
    .line 38
    if-eqz p0, :cond_4

    .line 39
    .line 40
    return v1

    .line 41
    :cond_4
    const/4 p0, 0x1

    .line 42
    return p0
.end method

.method public getC()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public getCL()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->cL:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getX0()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0:I

    .line 2
    .line 3
    return p0
.end method

.method public getX0L()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0L:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hashCode()I
    .locals 4

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->c:I

    .line 4
    .line 5
    xor-int/2addr v0, v1

    .line 6
    iget-wide v1, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0L:J

    .line 7
    .line 8
    long-to-int v3, v1

    .line 9
    xor-int/2addr v0, v3

    .line 10
    const/16 v3, 0x20

    .line 11
    .line 12
    shr-long/2addr v1, v3

    .line 13
    long-to-int v1, v1

    .line 14
    xor-int/2addr v0, v1

    .line 15
    iget-wide v1, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->cL:J

    .line 16
    .line 17
    long-to-int p0, v1

    .line 18
    xor-int/2addr p0, v0

    .line 19
    shr-long v0, v1, v3

    .line 20
    .line 21
    long-to-int v0, v0

    .line 22
    xor-int/2addr p0, v0

    .line 23
    return p0
.end method
