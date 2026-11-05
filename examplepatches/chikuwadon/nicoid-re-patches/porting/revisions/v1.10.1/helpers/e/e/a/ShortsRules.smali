.class public final Le/e/a/ShortsRules;
.super Ljava/lang/Object;
.source "ShortsRules.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static direction(FFFZ)I
    .registers 8
    .param p0, "dx"    # F
    .param p1, "dy"    # F
    .param p2, "density"    # F
    .param p3, "multiplePointers"    # Z

    .line 7
    if-nez p3, :cond_2c

    const/4 v0, 0x0

    cmpg-float v1, p2, v0

    if-lez v1, :cond_2c

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v2, 0x42e00000    # 112.0f

    mul-float v2, v2, p2

    cmpg-float v1, v1, v2

    if-ltz v1, :cond_2c

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    mul-float v2, v2, v3

    cmpg-float v1, v1, v2

    if-gez v1, :cond_24

    goto :goto_2c

    .line 8
    :cond_24
    cmpg-float v0, p1, v0

    if-gez v0, :cond_2a

    const/4 v0, 0x1

    goto :goto_2b

    :cond_2a
    const/4 v0, -0x1

    :goto_2b
    return v0

    .line 7
    :cond_2c
    :goto_2c
    const/4 v0, 0x0

    return v0
.end method

.method public static videoId(Ljava/lang/String;)Z
    .registers 2
    .param p0, "id"    # Ljava/lang/String;

    .line 10
    if-eqz p0, :cond_c

    const-string v0, "ss[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method
