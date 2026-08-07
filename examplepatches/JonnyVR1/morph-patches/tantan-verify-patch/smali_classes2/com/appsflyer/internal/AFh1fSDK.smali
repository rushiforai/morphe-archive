.class public final Lcom/appsflyer/internal/AFh1fSDK;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final AFAdRevenueData:I

.field public final getCurrencyIso4217Code:Ljava/lang/String;

.field public final getMonetizationNetwork:I

.field public final getRevenue:J


# direct methods
.method public constructor <init>(Ljava/lang/String;IIJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/appsflyer/internal/AFh1fSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/appsflyer/internal/AFh1fSDK;->AFAdRevenueData:I

    .line 7
    .line 8
    iput p3, p0, Lcom/appsflyer/internal/AFh1fSDK;->getMonetizationNetwork:I

    .line 9
    .line 10
    iput-wide p4, p0, Lcom/appsflyer/internal/AFh1fSDK;->getRevenue:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    const-class v2, Lcom/appsflyer/internal/AFh1fSDK;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Lcom/appsflyer/internal/AFh1fSDK;

    .line 18
    .line 19
    iget v2, p0, Lcom/appsflyer/internal/AFh1fSDK;->AFAdRevenueData:I

    .line 20
    .line 21
    iget v3, p1, Lcom/appsflyer/internal/AFh1fSDK;->AFAdRevenueData:I

    .line 22
    .line 23
    if-ne v2, v3, :cond_2

    .line 24
    .line 25
    iget v2, p0, Lcom/appsflyer/internal/AFh1fSDK;->getMonetizationNetwork:I

    .line 26
    .line 27
    iget v3, p1, Lcom/appsflyer/internal/AFh1fSDK;->getMonetizationNetwork:I

    .line 28
    .line 29
    if-ne v2, v3, :cond_2

    .line 30
    .line 31
    iget-wide v2, p0, Lcom/appsflyer/internal/AFh1fSDK;->getRevenue:J

    .line 32
    .line 33
    iget-wide v4, p1, Lcom/appsflyer/internal/AFh1fSDK;->getRevenue:J

    .line 34
    .line 35
    cmp-long v2, v2, v4

    .line 36
    .line 37
    if-nez v2, :cond_2

    .line 38
    .line 39
    iget-object p0, p0, Lcom/appsflyer/internal/AFh1fSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    iget-object p1, p1, Lcom/appsflyer/internal/AFh1fSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    return v0

    .line 52
    :cond_2
    :goto_0
    return v1
.end method

.method public final getCurrencyIso4217Code()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "sdk_ver"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/appsflyer/internal/AFh1fSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "min"

    .line 14
    .line 15
    iget v2, p0, Lcom/appsflyer/internal/AFh1fSDK;->AFAdRevenueData:I

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    const-string v1, "expire"

    .line 21
    .line 22
    iget v2, p0, Lcom/appsflyer/internal/AFh1fSDK;->getMonetizationNetwork:I

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    const-string v1, "ttl"

    .line 28
    .line 29
    iget-wide v2, p0, Lcom/appsflyer/internal/AFh1fSDK;->getRevenue:J

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    :catch_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public final hashCode()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFh1fSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    .line 12
    .line 13
    iget v1, p0, Lcom/appsflyer/internal/AFh1fSDK;->AFAdRevenueData:I

    .line 14
    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x1f

    .line 17
    .line 18
    iget v1, p0, Lcom/appsflyer/internal/AFh1fSDK;->getMonetizationNetwork:I

    .line 19
    .line 20
    add-int/2addr v0, v1

    .line 21
    mul-int/lit8 v0, v0, 0x1f

    .line 22
    .line 23
    iget-wide v1, p0, Lcom/appsflyer/internal/AFh1fSDK;->getRevenue:J

    .line 24
    .line 25
    long-to-int p0, v1

    .line 26
    add-int/2addr v0, p0

    .line 27
    return v0
.end method
