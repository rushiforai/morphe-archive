.class public final Lcom/appsflyer/internal/AFk1tSDK;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public AFAdRevenueData:I

.field public getCurrencyIso4217Code:I


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

.method public static getCurrencyIso4217Code(J[CI)[C
    .locals 10

    .line 1
    array-length v0, p2

    .line 2
    new-array v1, v0, [C

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x4

    .line 6
    move v4, v2

    .line 7
    move v5, v3

    .line 8
    :goto_0
    array-length v6, p2

    .line 9
    if-ge v2, v6, :cond_2

    .line 10
    .line 11
    ushr-long v6, p0, v2

    .line 12
    .line 13
    const-wide/16 v8, 0x1

    .line 14
    .line 15
    and-long/2addr v6, v8

    .line 16
    int-to-long v8, p3

    .line 17
    cmp-long v6, v6, v8

    .line 18
    .line 19
    if-nez v6, :cond_0

    .line 20
    .line 21
    if-ge v4, v3, :cond_0

    .line 22
    .line 23
    aget-char v6, p2, v2

    .line 24
    .line 25
    aput-char v6, v1, v4

    .line 26
    .line 27
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_0
    if-ge v5, v0, :cond_1

    .line 31
    .line 32
    aget-char v6, p2, v2

    .line 33
    .line 34
    aput-char v6, v1, v5

    .line 35
    .line 36
    add-int/lit8 v5, v5, 0x1

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_1
    aget-char v6, p2, v2

    .line 40
    .line 41
    aput-char v6, v1, v4

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-object v1
.end method
