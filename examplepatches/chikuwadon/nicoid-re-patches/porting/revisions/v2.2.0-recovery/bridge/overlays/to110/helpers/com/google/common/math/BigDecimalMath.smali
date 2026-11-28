.class public final Lcom/google/common/math/BigDecimalMath;
.super Ljava/lang/Object;
.source "BigDecimalMath.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkMaxIntegerDigits(Ljava/math/BigDecimal;I)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "x",
            "maxIntegerDigits"
        }
    .end annotation

    .line 118
    invoke-virtual {p0}, Ljava/math/BigDecimal;->precision()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0}, Ljava/math/BigDecimal;->scale()I

    move-result v2

    int-to-long v2, v2

    sub-long/2addr v0, v2

    int-to-long v2, p1

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    return-void

    .line 120
    :cond_0
    new-instance v2, Ljava/lang/ArithmeticException;

    .line 123
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p0, v0, p1}, [Ljava/lang/Object;

    move-result-object p0

    .line 121
    const-string p1, "BigDecimal (%s) requires %s integer digits, which is > maxIntegerDigits (%s)"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static roundToDouble(Ljava/math/BigDecimal;Ljava/math/RoundingMode;)D
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "x",
            "mode"
        }
    .end annotation

    .line 149
    sget-object v0, Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;->INSTANCE:Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;

    invoke-virtual {v0, p0, p1}, Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;->roundToDouble(Ljava/lang/Number;Ljava/math/RoundingMode;)D

    move-result-wide p0

    return-wide p0
.end method

.method public static toBigInteger(Ljava/math/BigDecimal;I)Ljava/math/BigInteger;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "x",
            "maxIntegerDigits"
        }
    .end annotation

    .line 64
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    const-string v0, "maxIntegerDigits"

    invoke-static {v0, p1}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 67
    invoke-virtual {p0}, Ljava/math/BigDecimal;->signum()I

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/math/BigDecimal;->precision()I

    move-result v0

    invoke-virtual {p0}, Ljava/math/BigDecimal;->scale()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 70
    invoke-static {p0, p1}, Lcom/google/common/math/BigDecimalMath;->checkMaxIntegerDigits(Ljava/math/BigDecimal;I)V

    .line 71
    invoke-virtual {p0}, Ljava/math/BigDecimal;->toBigInteger()Ljava/math/BigInteger;

    move-result-object p0

    return-object p0

    .line 68
    :cond_0
    sget-object p0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    return-object p0
.end method

.method public static toBigIntegerExact(Ljava/math/BigDecimal;I)Ljava/math/BigInteger;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "x",
            "maxIntegerDigits"
        }
    .end annotation

    .line 101
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    const-string v0, "maxIntegerDigits"

    invoke-static {v0, p1}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 104
    invoke-virtual {p0}, Ljava/math/BigDecimal;->signum()I

    move-result v0

    if-nez v0, :cond_0

    .line 105
    sget-object p0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    return-object p0

    .line 109
    :cond_0
    invoke-virtual {p0}, Ljava/math/BigDecimal;->precision()I

    move-result v0

    invoke-virtual {p0}, Ljava/math/BigDecimal;->scale()I

    move-result v1

    if-le v0, v1, :cond_1

    .line 113
    invoke-static {p0, p1}, Lcom/google/common/math/BigDecimalMath;->checkMaxIntegerDigits(Ljava/math/BigDecimal;I)V

    .line 114
    invoke-virtual {p0}, Ljava/math/BigDecimal;->toBigIntegerExact()Ljava/math/BigInteger;

    move-result-object p0

    return-object p0

    .line 110
    :cond_1
    new-instance p1, Ljava/lang/ArithmeticException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " has a nonzero fractional part and cannot be represented exactly as a BigInteger."

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
