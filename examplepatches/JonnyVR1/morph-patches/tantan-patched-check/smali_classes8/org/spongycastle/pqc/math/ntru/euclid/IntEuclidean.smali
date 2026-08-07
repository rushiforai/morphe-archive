.class public Lorg/spongycastle/pqc/math/ntru/euclid/IntEuclidean;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public gcd:I

.field public x:I

.field public y:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static calculate(II)Lorg/spongycastle/pqc/math/ntru/euclid/IntEuclidean;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    move v2, p1

    .line 4
    move p1, p0

    .line 5
    move p0, v2

    .line 6
    move v2, v1

    .line 7
    move v3, v2

    .line 8
    move v1, v0

    .line 9
    :goto_0
    if-eqz p0, :cond_0

    .line 10
    .line 11
    div-int v4, p1, p0

    .line 12
    .line 13
    rem-int/2addr p1, p0

    .line 14
    mul-int v5, v4, v1

    .line 15
    .line 16
    sub-int/2addr v3, v5

    .line 17
    mul-int/2addr v4, v2

    .line 18
    sub-int/2addr v0, v4

    .line 19
    move v6, p1

    .line 20
    move p1, p0

    .line 21
    move p0, v6

    .line 22
    move v6, v2

    .line 23
    move v2, v0

    .line 24
    move v0, v6

    .line 25
    move v6, v3

    .line 26
    move v3, v1

    .line 27
    move v1, v6

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    new-instance p0, Lorg/spongycastle/pqc/math/ntru/euclid/IntEuclidean;

    .line 30
    .line 31
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/ntru/euclid/IntEuclidean;-><init>()V

    .line 32
    .line 33
    .line 34
    iput v3, p0, Lorg/spongycastle/pqc/math/ntru/euclid/IntEuclidean;->x:I

    .line 35
    .line 36
    iput v0, p0, Lorg/spongycastle/pqc/math/ntru/euclid/IntEuclidean;->y:I

    .line 37
    .line 38
    iput p1, p0, Lorg/spongycastle/pqc/math/ntru/euclid/IntEuclidean;->gcd:I

    .line 39
    .line 40
    return-object p0
.end method
