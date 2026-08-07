.class public Lorg/spongycastle/math/ec/ECFieldElement$F2m;
.super Lorg/spongycastle/math/ec/ECFieldElement;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/math/ec/ECFieldElement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "F2m"
.end annotation


# static fields
.field public static final GNB:I = 0x1

.field public static final PPB:I = 0x3

.field public static final TPB:I = 0x2


# instance fields
.field private ks:[I

.field private m:I

.field private representation:I

.field private x:Lorg/spongycastle/math/ec/LongArray;


# direct methods
.method public constructor <init>(IIIILjava/math/BigInteger;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/math/ec/ECFieldElement;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p5, :cond_3

    .line 6
    .line 7
    invoke-virtual {p5}, Ljava/math/BigInteger;->signum()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ltz v1, :cond_3

    .line 12
    .line 13
    invoke-virtual {p5}, Ljava/math/BigInteger;->bitLength()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-gt v1, p1, :cond_3

    .line 18
    .line 19
    if-nez p3, :cond_0

    .line 20
    .line 21
    if-nez p4, :cond_0

    .line 22
    .line 23
    const/4 p3, 0x2

    .line 24
    iput p3, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->representation:I

    .line 25
    .line 26
    filled-new-array {p2}, [I

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iput-object p2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    if-ge p3, p4, :cond_2

    .line 34
    .line 35
    if-lez p3, :cond_1

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    iput v0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->representation:I

    .line 39
    .line 40
    filled-new-array {p2, p3, p4}, [I

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iput-object p2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 45
    .line 46
    :goto_0
    iput p1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 47
    .line 48
    new-instance p1, Lorg/spongycastle/math/ec/LongArray;

    .line 49
    .line 50
    invoke-direct {p1, p5}, Lorg/spongycastle/math/ec/LongArray;-><init>(Ljava/math/BigInteger;)V

    .line 51
    .line 52
    .line 53
    iput-object p1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    const-string p0, "k2 must be larger than 0"

    .line 57
    .line 58
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    throw v0

    .line 62
    :cond_2
    const-string p0, "k2 must be smaller than k3"

    .line 63
    .line 64
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    throw v0

    .line 68
    :cond_3
    const-string p0, "x value invalid in F2m field element"

    .line 69
    .line 70
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw v0
.end method

.method public constructor <init>(IILjava/math/BigInteger;)V
    .locals 6

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v5, p3

    .line 74
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;-><init>(IIIILjava/math/BigInteger;)V

    return-void
.end method

.method private constructor <init>(I[ILorg/spongycastle/math/ec/LongArray;)V
    .locals 1

    .line 75
    invoke-direct {p0}, Lorg/spongycastle/math/ec/ECFieldElement;-><init>()V

    .line 76
    iput p1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 77
    array-length p1, p2

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x2

    goto :goto_0

    :cond_0
    const/4 p1, 0x3

    :goto_0
    iput p1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->representation:I

    .line 78
    iput-object p2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 79
    iput-object p3, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    return-void
.end method

.method public static checkFieldElements(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    instance-of v0, p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    check-cast p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 10
    .line 11
    check-cast p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 12
    .line 13
    iget v0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->representation:I

    .line 14
    .line 15
    iget v1, p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->representation:I

    .line 16
    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    iget v0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 20
    .line 21
    iget v1, p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 22
    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 26
    .line 27
    iget-object p1, p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 28
    .line 29
    invoke-static {p0, p1}, Lorg/spongycastle/util/Arrays;->areEqual([I[I)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const-string p0, "Field elements are not elements of the same field F2m"

    .line 37
    .line 38
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const-string p0, "One of the F2m field elements has incorrect representation"

    .line 43
    .line 44
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    const-string p0, "Field elements are not both instances of ECFieldElement.F2m"

    .line 49
    .line 50
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method


# virtual methods
.method public add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/LongArray;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/spongycastle/math/ec/LongArray;

    .line 8
    .line 9
    check-cast p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 10
    .line 11
    iget-object p1, p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, p1, v1}, Lorg/spongycastle/math/ec/LongArray;->addShiftedByWords(Lorg/spongycastle/math/ec/LongArray;I)V

    .line 15
    .line 16
    .line 17
    new-instance p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 18
    .line 19
    iget v1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 20
    .line 21
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 22
    .line 23
    invoke-direct {p1, v1, p0, v0}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;-><init>(I[ILorg/spongycastle/math/ec/LongArray;)V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method

.method public addOne()Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 6
    .line 7
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/LongArray;->addOne()Lorg/spongycastle/math/ec/LongArray;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, v1, v2, p0}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;-><init>(I[ILorg/spongycastle/math/ec/LongArray;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public bitLength()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/LongArray;->degree()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public divide(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECFieldElement;->invert()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 12
    .line 13
    iget v1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 14
    .line 15
    iget v3, p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->representation:I

    .line 20
    .line 21
    iget v3, p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->representation:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 26
    .line 27
    iget-object v3, p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 28
    .line 29
    invoke-static {v1, v3}, Lorg/spongycastle/util/Arrays;->areEqual([I[I)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 36
    .line 37
    iget-object p1, p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lorg/spongycastle/math/ec/LongArray;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    return v0

    .line 46
    :cond_2
    return v2
.end method

.method public getFieldName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "F2m"

    .line 2
    .line 3
    return-object p0
.end method

.method public getFieldSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getK1()I
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public getK2()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x2

    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    aget p0, p0, v0

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public getK3()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x3

    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    aget p0, p0, v0

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public getM()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getRepresentation()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->representation:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/LongArray;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 8
    .line 9
    xor-int/2addr v0, v1

    .line 10
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->hashCode([I)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    xor-int/2addr p0, v0

    .line 17
    return p0
.end method

.method public invert()Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 6
    .line 7
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 8
    .line 9
    invoke-virtual {p0, v1, v2}, Lorg/spongycastle/math/ec/LongArray;->modInverse(I[I)Lorg/spongycastle/math/ec/LongArray;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, v1, v2, p0}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;-><init>(I[ILorg/spongycastle/math/ec/LongArray;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public isOne()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/LongArray;->isOne()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isZero()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/LongArray;->isZero()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 6
    .line 7
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 8
    .line 9
    check-cast p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 10
    .line 11
    iget-object p1, p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 12
    .line 13
    invoke-virtual {p0, p1, v1, v2}, Lorg/spongycastle/math/ec/LongArray;->modMultiply(Lorg/spongycastle/math/ec/LongArray;I[I)Lorg/spongycastle/math/ec/LongArray;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {v0, v1, v2, p0}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;-><init>(I[ILorg/spongycastle/math/ec/LongArray;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public multiplyMinusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->multiplyPlusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public multiplyPlusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 2
    .line 3
    check-cast p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 4
    .line 5
    iget-object p1, p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 6
    .line 7
    check-cast p2, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 8
    .line 9
    iget-object p2, p2, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 10
    .line 11
    check-cast p3, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 12
    .line 13
    iget-object p3, p3, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 14
    .line 15
    iget v1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 16
    .line 17
    iget-object v2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 18
    .line 19
    invoke-virtual {v0, p1, v1, v2}, Lorg/spongycastle/math/ec/LongArray;->multiply(Lorg/spongycastle/math/ec/LongArray;I[I)Lorg/spongycastle/math/ec/LongArray;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget v2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 24
    .line 25
    iget-object v3, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 26
    .line 27
    invoke-virtual {p2, p3, v2, v3}, Lorg/spongycastle/math/ec/LongArray;->multiply(Lorg/spongycastle/math/ec/LongArray;I[I)Lorg/spongycastle/math/ec/LongArray;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    if-eq v1, v0, :cond_0

    .line 32
    .line 33
    if-ne v1, p1, :cond_1

    .line 34
    .line 35
    :cond_0
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/LongArray;->clone()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    move-object v1, p1

    .line 40
    check-cast v1, Lorg/spongycastle/math/ec/LongArray;

    .line 41
    .line 42
    :cond_1
    const/4 p1, 0x0

    .line 43
    invoke-virtual {v1, p2, p1}, Lorg/spongycastle/math/ec/LongArray;->addShiftedByWords(Lorg/spongycastle/math/ec/LongArray;I)V

    .line 44
    .line 45
    .line 46
    iget p1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 47
    .line 48
    iget-object p2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 49
    .line 50
    invoke-virtual {v1, p1, p2}, Lorg/spongycastle/math/ec/LongArray;->reduce(I[I)V

    .line 51
    .line 52
    .line 53
    new-instance p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 54
    .line 55
    iget p2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 56
    .line 57
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 58
    .line 59
    invoke-direct {p1, p2, p0, v1}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;-><init>(I[ILorg/spongycastle/math/ec/LongArray;)V

    .line 60
    .line 61
    .line 62
    return-object p1
.end method

.method public negate()Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 0

    return-object p0
.end method

.method public sqrt()Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/LongArray;->isZero()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 10
    .line 11
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/LongArray;->isOne()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget v0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 19
    .line 20
    add-int/lit8 v0, v0, -0x1

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->squarePow(I)Lorg/spongycastle/math/ec/ECFieldElement;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :cond_1
    :goto_0
    return-object p0
.end method

.method public square()Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 6
    .line 7
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 8
    .line 9
    invoke-virtual {p0, v1, v2}, Lorg/spongycastle/math/ec/LongArray;->modSquare(I[I)Lorg/spongycastle/math/ec/LongArray;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, v1, v2, p0}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;-><init>(I[ILorg/spongycastle/math/ec/LongArray;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public squareMinusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->squarePlusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public squarePlusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 2
    .line 3
    check-cast p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 4
    .line 5
    iget-object p1, p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 6
    .line 7
    check-cast p2, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 8
    .line 9
    iget-object p2, p2, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 10
    .line 11
    iget v1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 12
    .line 13
    iget-object v2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/math/ec/LongArray;->square(I[I)Lorg/spongycastle/math/ec/LongArray;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget v2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 20
    .line 21
    iget-object v3, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 22
    .line 23
    invoke-virtual {p1, p2, v2, v3}, Lorg/spongycastle/math/ec/LongArray;->multiply(Lorg/spongycastle/math/ec/LongArray;I[I)Lorg/spongycastle/math/ec/LongArray;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-ne v1, v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/LongArray;->clone()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    move-object v1, p2

    .line 34
    check-cast v1, Lorg/spongycastle/math/ec/LongArray;

    .line 35
    .line 36
    :cond_0
    const/4 p2, 0x0

    .line 37
    invoke-virtual {v1, p1, p2}, Lorg/spongycastle/math/ec/LongArray;->addShiftedByWords(Lorg/spongycastle/math/ec/LongArray;I)V

    .line 38
    .line 39
    .line 40
    iget p1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 41
    .line 42
    iget-object p2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 43
    .line 44
    invoke-virtual {v1, p1, p2}, Lorg/spongycastle/math/ec/LongArray;->reduce(I[I)V

    .line 45
    .line 46
    .line 47
    new-instance p1, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 48
    .line 49
    iget p2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 50
    .line 51
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 52
    .line 53
    invoke-direct {p1, p2, p0, v1}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;-><init>(I[ILorg/spongycastle/math/ec/LongArray;)V

    .line 54
    .line 55
    .line 56
    return-object p1
.end method

.method public squarePow(I)Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ge p1, v0, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;

    .line 6
    .line 7
    iget v1, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->m:I

    .line 8
    .line 9
    iget-object v2, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->ks:[I

    .line 10
    .line 11
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 12
    .line 13
    invoke-virtual {p0, p1, v1, v2}, Lorg/spongycastle/math/ec/LongArray;->modSquareN(II[I)Lorg/spongycastle/math/ec/LongArray;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {v0, v1, v2, p0}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;-><init>(I[ILorg/spongycastle/math/ec/LongArray;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public subtract(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public testBitZero()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/LongArray;->testBitZero()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toBigInteger()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECFieldElement$F2m;->x:Lorg/spongycastle/math/ec/LongArray;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/LongArray;->toBigInteger()Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
