.class final enum Lcom/google/common/math/LongMath$MillerRabinTester$2;
.super Lcom/google/common/math/LongMath$MillerRabinTester;
.source "LongMath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/math/LongMath$MillerRabinTester;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4010
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "$enum$name",
            "$enum$ordinal"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1110
    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/math/LongMath$MillerRabinTester;-><init>(Ljava/lang/String;ILcom/google/common/math/LongMath$1;)V

    return-void
.end method


# virtual methods
.method mulMod(JJJ)J
    .registers 20
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "a",
            "b",
            "m"
        }
    .end annotation

    move-wide/from16 v5, p5

    const/16 v0, 0x20

    ushr-long v1, p1, v0

    ushr-long v3, p3, v0

    const-wide v7, 0xffffffffL

    and-long v9, p1, v7

    and-long v7, p3, v7

    mul-long v11, v1, v3

    .line 1144
    invoke-virtual {p0, v11, v12, v5, v6}, Lcom/google/common/math/LongMath$MillerRabinTester$2;->times2ToThe32Mod(JJ)J

    move-result-wide v11

    mul-long/2addr v1, v7

    add-long/2addr v11, v1

    const-wide/16 v0, 0x0

    cmp-long v0, v11, v0

    if-gez v0, :cond_0

    .line 1147
    invoke-static {v11, v12, v5, v6}, Lcom/google/common/primitives/UnsignedLongs;->remainder(JJ)J

    move-result-wide v11

    :cond_0
    mul-long/2addr v3, v9

    add-long/2addr v11, v3

    .line 1151
    invoke-virtual {p0, v11, v12, v5, v6}, Lcom/google/common/math/LongMath$MillerRabinTester$2;->times2ToThe32Mod(JJ)J

    move-result-wide v1

    mul-long/2addr v9, v7

    .line 1152
    invoke-static {v9, v10, v5, v6}, Lcom/google/common/primitives/UnsignedLongs;->remainder(JJ)J

    move-result-wide v3

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/google/common/math/LongMath$MillerRabinTester$2;->plusMod(JJJ)J

    move-result-wide v0

    return-wide v0
.end method

.method plusMod(JJJ)J
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "a",
            "b",
            "m"
        }
    .end annotation

    sub-long v0, p5, p3

    cmp-long p0, p1, v0

    add-long/2addr p1, p3

    if-ltz p0, :cond_0

    sub-long/2addr p1, p5

    :cond_0
    return-wide p1
.end method

.method squareMod(JJ)J
    .registers 16
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "a",
            "m"
        }
    .end annotation

    const/16 v0, 0x20

    ushr-long v0, p1, v0

    const-wide v2, 0xffffffffL

    and-long/2addr p1, v2

    mul-long v2, v0, v0

    .line 1167
    invoke-virtual {p0, v2, v3, p3, p4}, Lcom/google/common/math/LongMath$MillerRabinTester$2;->times2ToThe32Mod(JJ)J

    move-result-wide v2

    mul-long/2addr v0, p1

    const/4 v4, 0x1

    shl-long/2addr v0, v4

    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-gez v4, :cond_0

    .line 1170
    invoke-static {v0, v1, p3, p4}, Lcom/google/common/primitives/UnsignedLongs;->remainder(JJ)J

    move-result-wide v0

    :cond_0
    add-long/2addr v2, v0

    .line 1174
    invoke-virtual {p0, v2, v3, p3, p4}, Lcom/google/common/math/LongMath$MillerRabinTester$2;->times2ToThe32Mod(JJ)J

    move-result-wide v5

    mul-long/2addr p1, p1

    .line 1175
    invoke-static {p1, p2, p3, p4}, Lcom/google/common/primitives/UnsignedLongs;->remainder(JJ)J

    move-result-wide v7

    move-object v4, p0

    move-wide v9, p3

    invoke-virtual/range {v4 .. v10}, Lcom/google/common/math/LongMath$MillerRabinTester$2;->plusMod(JJJ)J

    move-result-wide p0

    return-wide p0
.end method

.method times2ToThe32Mod(JJ)J
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "a",
            "m"
        }
    .end annotation

    const/16 p0, 0x20

    .line 1120
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result v0

    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    shl-long/2addr p1, v0

    .line 1123
    invoke-static {p1, p2, p3, p4}, Lcom/google/common/primitives/UnsignedLongs;->remainder(JJ)J

    move-result-wide p1

    sub-int/2addr p0, v0

    if-gtz p0, :cond_0

    return-wide p1
.end method
