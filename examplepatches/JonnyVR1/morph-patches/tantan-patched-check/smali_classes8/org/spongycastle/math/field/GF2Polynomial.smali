.class Lorg/spongycastle/math/field/GF2Polynomial;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/math/field/Polynomial;


# instance fields
.field protected final exponents:[I


# direct methods
.method public constructor <init>([I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lorg/spongycastle/math/field/GF2Polynomial;->exponents:[I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, Lorg/spongycastle/math/field/GF2Polynomial;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    check-cast p1, Lorg/spongycastle/math/field/GF2Polynomial;

    .line 12
    .line 13
    iget-object p0, p0, Lorg/spongycastle/math/field/GF2Polynomial;->exponents:[I

    .line 14
    .line 15
    iget-object p1, p1, Lorg/spongycastle/math/field/GF2Polynomial;->exponents:[I

    .line 16
    .line 17
    invoke-static {p0, p1}, Lorg/spongycastle/util/Arrays;->areEqual([I[I)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public getDegree()I
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/field/GF2Polynomial;->exponents:[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    add-int/lit8 v0, v0, -0x1

    .line 5
    .line 6
    aget p0, p0, v0

    .line 7
    .line 8
    return p0
.end method

.method public getExponentsPresent()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/field/GF2Polynomial;->exponents:[I

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/field/GF2Polynomial;->exponents:[I

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->hashCode([I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
