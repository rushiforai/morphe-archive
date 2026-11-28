.class final Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;
.super Lcom/google/common/math/ToDoubleRounder;
.source "BigDecimalMath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/math/BigDecimalMath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "BigDecimalToDoubleRounder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/math/ToDoubleRounder<",
        "Ljava/math/BigDecimal;",
        ">;"
    }
.end annotation


# static fields
.field static final INSTANCE:Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 153
    new-instance v0, Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;

    invoke-direct {v0}, Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;-><init>()V

    sput-object v0, Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;->INSTANCE:Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 155
    invoke-direct {p0}, Lcom/google/common/math/ToDoubleRounder;-><init>()V

    return-void
.end method


# virtual methods
.method bridge synthetic minus(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "a",
            "b"
        }
    .end annotation

    .line 152
    check-cast p1, Ljava/math/BigDecimal;

    check-cast p2, Ljava/math/BigDecimal;

    invoke-virtual {p0, p1, p2}, Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;->minus(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method minus(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "a",
            "b"
        }
    .end annotation

    .line 174
    invoke-virtual {p1, p2}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method bridge synthetic roundToDoubleArbitrarily(Ljava/lang/Number;)D
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "bigDecimal"
        }
    .end annotation

    .line 152
    check-cast p1, Ljava/math/BigDecimal;

    invoke-virtual {p0, p1}, Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;->roundToDoubleArbitrarily(Ljava/math/BigDecimal;)D

    move-result-wide p0

    return-wide p0
.end method

.method roundToDoubleArbitrarily(Ljava/math/BigDecimal;)D
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bigDecimal"
        }
    .end annotation

    .line 159
    invoke-virtual {p1}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide p0

    return-wide p0
.end method

.method bridge synthetic sign(Ljava/lang/Number;)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "bigDecimal"
        }
    .end annotation

    .line 152
    check-cast p1, Ljava/math/BigDecimal;

    invoke-virtual {p0, p1}, Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;->sign(Ljava/math/BigDecimal;)I

    move-result p0

    return p0
.end method

.method sign(Ljava/math/BigDecimal;)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bigDecimal"
        }
    .end annotation

    .line 164
    invoke-virtual {p1}, Ljava/math/BigDecimal;->signum()I

    move-result p0

    return p0
.end method

.method bridge synthetic toX(DLjava/math/RoundingMode;)Ljava/lang/Number;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "d",
            "mode"
        }
    .end annotation

    .line 152
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/math/BigDecimalMath$BigDecimalToDoubleRounder;->toX(DLjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method toX(DLjava/math/RoundingMode;)Ljava/math/BigDecimal;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "d",
            "mode"
        }
    .end annotation

    .line 169
    new-instance p0, Ljava/math/BigDecimal;

    invoke-direct {p0, p1, p2}, Ljava/math/BigDecimal;-><init>(D)V

    return-object p0
.end method
