.class public abstract Ly8e;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/math/RoundingMode;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    sput-object v0, Ly8e;->a:Ljava/math/RoundingMode;

    return-void
.end method

.method public static final a(IILjava/math/BigInteger;)Ljava/math/BigInteger;
    .registers 3

    sub-int/2addr p1, p0

    if-gez p1, :cond_18

    new-instance p0, Ljava/math/BigDecimal;

    invoke-direct {p0, p2}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;)V

    invoke-virtual {p0, p1}, Ljava/math/BigDecimal;->scaleByPowerOfTen(I)Ljava/math/BigDecimal;

    move-result-object p0

    const/4 p1, 0x0

    sget-object p2, Ly8e;->a:Ljava/math/RoundingMode;

    invoke-virtual {p0, p1, p2}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object p0

    invoke-virtual {p0}, Ljava/math/BigDecimal;->toBigIntegerExact()Ljava/math/BigInteger;

    move-result-object p0

    return-object p0

    :cond_18
    if-lez p1, :cond_27

    sget-object p0, Lpe3;->a:Ljava/math/BigInteger;

    sget-object p0, Lpe3;->d:Ljava/math/BigInteger;

    invoke-virtual {p0, p1}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0

    :cond_27
    return-object p2
.end method

.method public static final b(I)Ljava/math/BigDecimal;
    .registers 4

    sget-object v0, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    sget-object v1, Ly8e;->a:Ljava/math/RoundingMode;

    if-ne v1, v0, :cond_20

    sget-object v1, Lhe3;->a:Ljava/math/BigDecimal;

    sget-object v1, Lhe3;->b:Ljava/math/BigDecimal;

    neg-int v2, p0

    invoke-virtual {v1, v2}, Ljava/math/BigDecimal;->scaleByPowerOfTen(I)Ljava/math/BigDecimal;

    move-result-object v1

    add-int/lit8 p0, p0, 0x1

    invoke-virtual {v1, p0, v0}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object p0

    const-wide/16 v1, 0x2

    invoke-static {v1, v2}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;Ljava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0

    :cond_20
    const-string p0, "Check failed."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method
