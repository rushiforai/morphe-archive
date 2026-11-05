.class public final synthetic Le/e/a/SeekFeedback219$$ExternalSyntheticBackportWithForwarding1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"


# direct methods
.method public static synthetic m(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 3

    .line 0
    invoke-virtual {p0}, Ljava/math/BigDecimal;->signum()I

    move-result v0

    if-nez v0, :cond_f

    new-instance p0, Ljava/math/BigDecimal;

    sget-object v0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;I)V

    return-object p0

    :cond_f
    invoke-virtual {p0}, Ljava/math/BigDecimal;->stripTrailingZeros()Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method
