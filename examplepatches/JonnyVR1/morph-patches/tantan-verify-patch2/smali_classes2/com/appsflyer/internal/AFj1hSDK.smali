.class public final Lcom/appsflyer/internal/AFj1hSDK;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method private static AFAdRevenueData([I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    array-length v1, p0

    .line 3
    div-int/lit8 v1, v1, 0x2

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    aget v1, p0, v0

    .line 8
    .line 9
    array-length v2, p0

    .line 10
    sub-int/2addr v2, v0

    .line 11
    add-int/lit8 v2, v2, -0x1

    .line 12
    .line 13
    aget v2, p0, v2

    .line 14
    .line 15
    aput v2, p0, v0

    .line 16
    .line 17
    array-length v2, p0

    .line 18
    sub-int/2addr v2, v0

    .line 19
    add-int/lit8 v2, v2, -0x1

    .line 20
    .line 21
    aput v1, p0, v2

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method private static getCurrencyIso4217Code(I[[I)I
    .locals 4

    .line 1
    ushr-int/lit8 v0, p0, 0x18

    .line 2
    .line 3
    ushr-int/lit8 v1, p0, 0x10

    .line 4
    .line 5
    and-int/lit16 v1, v1, 0xff

    .line 6
    .line 7
    ushr-int/lit8 v2, p0, 0x8

    .line 8
    .line 9
    and-int/lit16 v2, v2, 0xff

    .line 10
    .line 11
    and-int/lit16 p0, p0, 0xff

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    aget-object v3, p1, v3

    .line 15
    .line 16
    aget v0, v3, v0

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    aget-object v3, p1, v3

    .line 20
    .line 21
    aget v1, v3, v1

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    const/4 v1, 0x2

    .line 25
    aget-object v1, p1, v1

    .line 26
    .line 27
    aget v1, v1, v2

    .line 28
    .line 29
    xor-int/2addr v0, v1

    .line 30
    const/4 v1, 0x3

    .line 31
    aget-object p1, p1, v1

    .line 32
    .line 33
    aget p0, p1, p0

    .line 34
    .line 35
    add-int/2addr v0, p0

    .line 36
    return v0
.end method

.method public static getRevenue(IIZI[I[[I[I)V
    .locals 4

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-static {p4}, Lcom/appsflyer/internal/AFj1hSDK;->AFAdRevenueData([I)V

    .line 4
    .line 5
    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    move v1, v0

    .line 8
    :goto_0
    if-ge v1, p3, :cond_1

    .line 9
    .line 10
    aget v2, p4, v1

    .line 11
    .line 12
    xor-int/2addr p0, v2

    .line 13
    invoke-static {p0, p5}, Lcom/appsflyer/internal/AFj1hSDK;->getCurrencyIso4217Code(I[[I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    xor-int/2addr p1, v2

    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    move v3, p1

    .line 21
    move p1, p0

    .line 22
    move p0, v3

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    array-length p3, p4

    .line 25
    add-int/lit8 p3, p3, -0x2

    .line 26
    .line 27
    aget p3, p4, p3

    .line 28
    .line 29
    xor-int/2addr p0, p3

    .line 30
    array-length p3, p4

    .line 31
    const/4 p5, 0x1

    .line 32
    sub-int/2addr p3, p5

    .line 33
    aget p3, p4, p3

    .line 34
    .line 35
    xor-int/2addr p1, p3

    .line 36
    if-nez p2, :cond_2

    .line 37
    .line 38
    invoke-static {p4}, Lcom/appsflyer/internal/AFj1hSDK;->AFAdRevenueData([I)V

    .line 39
    .line 40
    .line 41
    :cond_2
    aput p1, p6, v0

    .line 42
    .line 43
    aput p0, p6, p5

    .line 44
    .line 45
    return-void
.end method
