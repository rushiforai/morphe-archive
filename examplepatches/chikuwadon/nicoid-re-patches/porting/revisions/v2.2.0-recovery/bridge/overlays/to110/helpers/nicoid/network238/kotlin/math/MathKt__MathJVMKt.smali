.class abstract Lnicoid/network238/kotlin/math/MathKt__MathJVMKt;
.super Lnicoid/network238/kotlin/math/MathKt__MathHKt;
.source "SourceFile"


# direct methods
.method public static getSign(I)I
    .registers 1

    .line 1231
    invoke-static {p0}, Ljava/lang/Integer;->signum(I)I

    move-result p0

    return p0
.end method

.method public static getSign(J)I
    .registers 2

    .line 1280
    invoke-static {p0, p1}, Ljava/lang/Long;->signum(J)I

    move-result p0

    return p0
.end method
