.class public final Le/e/a/DisplayRules119;
.super Ljava/lang/Object;
.source "DisplayRules119.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dark(I)Z
    .registers 7

    .line 7
    shr-int/lit8 v0, p0, 0x10

    and-int/lit16 v0, v0, 0xff

    int-to-double v0, v0

    const-wide v2, 0x3fcb367a0f9096bcL    # 0.2126

    mul-double v0, v0, v2

    shr-int/lit8 v2, p0, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-double v2, v2

    const-wide v4, 0x3fe6e2eb1c432ca5L    # 0.7152

    mul-double v2, v2, v4

    add-double/2addr v0, v2

    and-int/lit16 p0, p0, 0xff

    int-to-double v2, p0

    const-wide v4, 0x3fb27bb2fec56d5dL    # 0.0722

    mul-double v2, v2, v4

    add-double/2addr v0, v2

    const-wide v2, 0x4061800000000000L    # 140.0

    cmpg-double p0, v0, v2

    if-gez p0, :cond_2f

    const/4 p0, 0x1

    return p0

    :cond_2f
    const/4 p0, 0x0

    return p0
.end method

.method public static parseColor(Ljava/lang/String;)I
    .registers 2

    .line 6
    if-eqz p0, :cond_19

    const-string v0, "#[0-9a-fA-F]{6}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x10

    invoke-static {p0, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    const/high16 v0, -0x1000000

    or-int/2addr p0, v0

    return p0

    :cond_19
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
.end method

.method public static progress(JJZ)F
    .registers 7

    .line 5
    if-eqz p4, :cond_17

    const-wide/16 v0, 0x0

    cmp-long p4, p0, v0

    if-lez p4, :cond_17

    cmp-long p4, p2, v0

    if-gtz p4, :cond_d

    goto :goto_17

    :cond_d
    long-to-float p0, p0

    long-to-float p1, p2

    div-float/2addr p0, p1

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {p1, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    goto :goto_18

    :cond_17
    :goto_17
    const/4 p0, 0x0

    :goto_18
    return p0
.end method

.method public static visible([Z[Z[ZZ)Ljava/util/List;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([Z[Z[ZZ)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 8
    array-length v0, p0

    array-length v1, p1

    if-ne v0, v1, :cond_60

    array-length v0, p0

    array-length v1, p2

    if-ne v0, v1, :cond_60

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_13
    array-length v7, p0

    if-lt v3, v7, :cond_17

    return-object v0

    :cond_17
    aget-boolean v7, p0, v3

    const/4 v8, 0x1

    if-eqz v7, :cond_40

    if-eqz p3, :cond_24

    aget-boolean v2, p1, v3

    if-eqz v2, :cond_24

    const/4 v5, 0x1

    goto :goto_25

    :cond_24
    const/4 v5, 0x0

    :goto_25
    if-nez p3, :cond_2d

    aget-boolean v2, p2, v3

    if-eqz v2, :cond_2d

    const/4 v4, 0x1

    goto :goto_2e

    :cond_2d
    const/4 v4, 0x0

    :goto_2e
    if-eqz p3, :cond_36

    if-eqz v5, :cond_33

    goto :goto_36

    :cond_33
    move v2, v3

    const/4 v6, 0x0

    goto :goto_5d

    :cond_36
    :goto_36
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v2, v3

    const/4 v6, 0x1

    goto :goto_5d

    :cond_40
    if-nez v4, :cond_5d

    if-eqz p3, :cond_4a

    if-nez v5, :cond_4a

    aget-boolean v7, p1, v3

    if-eqz v7, :cond_5d

    :cond_4a
    if-ltz v2, :cond_56

    if-nez v6, :cond_56

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v6, 0x1

    :cond_56
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5d
    :goto_5d
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    :cond_60
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
.end method
