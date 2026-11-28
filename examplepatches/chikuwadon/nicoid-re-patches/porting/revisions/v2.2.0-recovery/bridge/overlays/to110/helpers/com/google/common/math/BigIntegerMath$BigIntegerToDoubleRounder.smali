.class final Lcom/google/common/math/BigIntegerMath$BigIntegerToDoubleRounder;
.super Lcom/google/common/math/ToDoubleRounder;
.source "BigIntegerMath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/math/BigIntegerMath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "BigIntegerToDoubleRounder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/math/ToDoubleRounder<",
        "Ljava/math/BigInteger;",
        ">;"
    }
.end annotation


# static fields
.field static final INSTANCE:Lcom/google/common/math/BigIntegerMath$BigIntegerToDoubleRounder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 331
    new-instance v0, Lcom/google/common/math/BigIntegerMath$BigIntegerToDoubleRounder;

    invoke-direct {v0}, Lcom/google/common/math/BigIntegerMath$BigIntegerToDoubleRounder;-><init>()V

    sput-object v0, Lcom/google/common/math/BigIntegerMath$BigIntegerToDoubleRounder;->INSTANCE:Lcom/google/common/math/BigIntegerMath$BigIntegerToDoubleRounder;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 333
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

    .line 329
    check-cast p1, Ljava/math/BigInteger;

    check-cast p2, Ljava/math/BigInteger;

    invoke-virtual {p0, p1, p2}, Lcom/google/common/math/BigIntegerMath$BigIntegerToDoubleRounder;->minus(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method minus(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;
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

    .line 352
    invoke-virtual {p1, p2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

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
            "bigInteger"
        }
    .end annotation

    .line 329
    check-cast p1, Ljava/math/BigInteger;

    invoke-virtual {p0, p1}, Lcom/google/common/math/BigIntegerMath$BigIntegerToDoubleRounder;->roundToDoubleArbitrarily(Ljava/math/BigInteger;)D

    move-result-wide p0

    return-wide p0
.end method

.method roundToDoubleArbitrarily(Ljava/math/BigInteger;)D
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bigInteger"
        }
    .end annotation

    .line 337
    invoke-static {p1}, Lcom/google/common/math/DoubleUtils;->bigToDouble(Ljava/math/BigInteger;)D

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
            "bigInteger"
        }
    .end annotation

    .line 329
    check-cast p1, Ljava/math/BigInteger;

    invoke-virtual {p0, p1}, Lcom/google/common/math/BigIntegerMath$BigIntegerToDoubleRounder;->sign(Ljava/math/BigInteger;)I

    move-result p0

    return p0
.end method

.method sign(Ljava/math/BigInteger;)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bigInteger"
        }
    .end annotation

    .line 342
    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

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

    .line 329
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/math/BigIntegerMath$BigIntegerToDoubleRounder;->toX(DLjava/math/RoundingMode;)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method toX(DLjava/math/RoundingMode;)Ljava/math/BigInteger;
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

    .line 347
    invoke-static {p1, p2, p3}, Lcom/google/common/math/DoubleMath;->roundToBigInteger(DLjava/math/RoundingMode;)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method
