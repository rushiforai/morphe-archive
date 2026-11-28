.class final Lcom/google/common/math/DoubleUtils;
.super Ljava/lang/Object;
.source "DoubleUtils.java"


# static fields
.field static final EXPONENT_BIAS:I = 0x3ff

.field static final IMPLICIT_BIT:J = 0x10000000000000L

.field static final ONE_BITS:J = 0x3ff0000000000000L

.field static final SIGNIFICAND_BITS:I = 0x34

.field static final SIGNIFICAND_MASK:J = 0xfffffffffffffL

.field static final SIGN_MASK:J = -0x8000000000000000L


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static bigToDouble(Ljava/math/BigInteger;)D
    .registers 14
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "x"
        }
    .end annotation

    .line 82
    invoke-virtual {p0}, Ljava/math/BigInteger;->abs()Ljava/math/BigInteger;

    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ljava/math/BigInteger;->bitLength()I

    move-result v1

    add-int/lit8 v2, v1, -0x1

    const/16 v3, 0x3f

    if-ge v2, v3, :cond_0

    .line 86
    invoke-virtual {p0}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    long-to-double v0, v0

    return-wide v0

    :cond_0
    const/16 v3, 0x3ff

    if-le v2, v3, :cond_1

    .line 88
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result p0

    int-to-double v0, p0

    const-wide/high16 v2, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    mul-double/2addr v0, v2

    return-wide v0

    :cond_1
    add-int/lit8 v2, v1, -0x36

    .line 100
    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v3

    const/4 v5, 0x1

    shr-long v5, v3, v5

    const-wide v7, 0xfffffffffffffL

    and-long/2addr v7, v5

    const-wide/16 v9, 0x1

    and-long/2addr v3, v9

    const-wide/16 v11, 0x0

    cmp-long v3, v3, v11

    if-eqz v3, :cond_3

    and-long/2addr v5, v9

    cmp-long v3, v5, v11

    if-nez v3, :cond_2

    .line 110
    invoke-virtual {v0}, Ljava/math/BigInteger;->getLowestSetBit()I

    move-result v0

    if-ge v0, v2, :cond_3

    :cond_2
    add-long/2addr v7, v9

    :cond_3
    add-int/lit16 v1, v1, 0x3fe

    int-to-long v0, v1

    const/16 v2, 0x34

    shl-long/2addr v0, v2

    add-long/2addr v0, v7

    .line 120
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result p0

    int-to-long v2, p0

    const-wide/high16 v4, -0x8000000000000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 121
    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method static ensureNonNegative(D)D
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 126
    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    const-wide/16 v0, 0x0

    .line 127
    invoke-static {p0, p1, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide p0

    return-wide p0
.end method

.method static getSignificand(D)J
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "d"
        }
    .end annotation

    .line 56
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleUtils;->isFinite(D)Z

    move-result v0

    const-string v1, "not a normal value"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 57
    invoke-static {p0, p1}, Ljava/lang/Math;->getExponent(D)I

    move-result v0

    .line 58
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p0

    const-wide v1, 0xfffffffffffffL

    and-long/2addr p0, v1

    const/16 v1, -0x3ff

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    shl-long/2addr p0, v0

    return-wide p0

    :cond_0
    const-wide/high16 v0, 0x10000000000000L

    or-long/2addr p0, v0

    return-wide p0
.end method

.method static isFinite(D)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "d"
        }
    .end annotation

    .line 64
    invoke-static {p0, p1}, Ljava/lang/Math;->getExponent(D)I

    move-result p0

    const/16 p1, 0x3ff

    if-gt p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static isNormal(D)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "d"
        }
    .end annotation

    .line 68
    invoke-static {p0, p1}, Ljava/lang/Math;->getExponent(D)I

    move-result p0

    const/16 p1, -0x3fe

    if-lt p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static scaleNormalize(D)D
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "x"
        }
    .end annotation

    .line 76
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p0

    const-wide v0, 0xfffffffffffffL

    and-long/2addr p0, v0

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    or-long/2addr p0, v0

    .line 77
    invoke-static {p0, p1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide p0

    return-wide p0
.end method
