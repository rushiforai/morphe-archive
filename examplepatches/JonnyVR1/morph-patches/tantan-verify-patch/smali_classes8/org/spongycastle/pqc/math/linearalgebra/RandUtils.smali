.class public Lorg/spongycastle/pqc/math/linearalgebra/RandUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static nextInt(Ljava/security/SecureRandom;I)I
    .locals 3

    .line 1
    neg-int v0, p1

    .line 2
    and-int/2addr v0, p1

    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    int-to-long v0, p1

    .line 6
    invoke-virtual {p0}, Ljava/util/Random;->nextInt()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    ushr-int/lit8 p0, p0, 0x1

    .line 11
    .line 12
    int-to-long p0, p0

    .line 13
    mul-long/2addr v0, p0

    .line 14
    const/16 p0, 0x1f

    .line 15
    .line 16
    shr-long p0, v0, p0

    .line 17
    .line 18
    long-to-int p0, p0

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-virtual {p0}, Ljava/util/Random;->nextInt()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    ushr-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    rem-int v1, v0, p1

    .line 27
    .line 28
    sub-int/2addr v0, v1

    .line 29
    add-int/lit8 v2, p1, -0x1

    .line 30
    .line 31
    add-int/2addr v0, v2

    .line 32
    if-ltz v0, :cond_0

    .line 33
    .line 34
    return v1
.end method
