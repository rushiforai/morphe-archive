.class public final Lcom/appsflyer/internal/AFk1wSDK;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public getCurrencyIso4217Code:I

.field public getMediationNetwork:I

.field public getMonetizationNetwork:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getMediationNetwork(I)I
    .locals 5

    .line 1
    sget-object v0, Lcom/appsflyer/internal/AFj1kSDK;->getRevenue:Lcom/appsflyer/internal/AFj1kSDK;

    .line 2
    .line 3
    ushr-int/lit8 v1, p0, 0x18

    .line 4
    .line 5
    and-int/lit16 v1, v1, 0xff

    .line 6
    .line 7
    ushr-int/lit8 v2, p0, 0x10

    .line 8
    .line 9
    and-int/lit16 v2, v2, 0xff

    .line 10
    .line 11
    ushr-int/lit8 v3, p0, 0x8

    .line 12
    .line 13
    and-int/lit16 v3, v3, 0xff

    .line 14
    .line 15
    and-int/lit16 p0, p0, 0xff

    .line 16
    .line 17
    iget-object v0, v0, Lcom/appsflyer/internal/AFj1kSDK;->AFAdRevenueData:[[I

    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    aget-object v4, v0, v4

    .line 21
    .line 22
    aget v1, v4, v1

    .line 23
    .line 24
    const/4 v4, 0x1

    .line 25
    aget-object v4, v0, v4

    .line 26
    .line 27
    aget v2, v4, v2

    .line 28
    .line 29
    add-int/2addr v1, v2

    .line 30
    const/4 v2, 0x2

    .line 31
    aget-object v2, v0, v2

    .line 32
    .line 33
    aget v2, v2, v3

    .line 34
    .line 35
    xor-int/2addr v1, v2

    .line 36
    const/4 v2, 0x3

    .line 37
    aget-object v0, v0, v2

    .line 38
    .line 39
    aget p0, v0, p0

    .line 40
    .line 41
    add-int/2addr v1, p0

    .line 42
    return v1
.end method

.method public static getMonetizationNetwork([I)V
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
