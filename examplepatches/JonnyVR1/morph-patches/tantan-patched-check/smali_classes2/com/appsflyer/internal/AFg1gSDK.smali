.class public final Lcom/appsflyer/internal/AFg1gSDK;
.super Lcom/appsflyer/internal/AFf1oSDK;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/appsflyer/internal/AFf1oSDK<",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final component3:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final copy:Lcom/appsflyer/internal/AFd1pSDK;

.field private final copydefault:Lcom/appsflyer/internal/AFe1sSDK;

.field private equals:Ljava/util/Map;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final hashCode:Lcom/appsflyer/internal/AFh1qSDK;

.field private final toString:Lcom/appsflyer/internal/AFd1rSDK;

.field private valueOf:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "playstore"

    .line 2
    .line 3
    const-string v1, "googleplaystore"

    .line 4
    .line 5
    const-string v2, "googleplay"

    .line 6
    .line 7
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/appsflyer/internal/AFg1gSDK;->component3:Ljava/util/List;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Lcom/appsflyer/internal/AFd1fSDK;)V
    .locals 3
    .param p1    # Lcom/appsflyer/internal/AFd1fSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/appsflyer/internal/AFf1zSDK;->equals:Lcom/appsflyer/internal/AFf1zSDK;

    .line 2
    .line 3
    sget-object v1, Lcom/appsflyer/internal/AFf1zSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFf1zSDK;

    .line 4
    .line 5
    filled-new-array {v1}, [Lcom/appsflyer/internal/AFf1zSDK;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "GCD-FETCH"

    .line 10
    .line 11
    invoke-direct {p0, v0, v1, p1, v2}, Lcom/appsflyer/internal/AFf1oSDK;-><init>(Lcom/appsflyer/internal/AFf1zSDK;[Lcom/appsflyer/internal/AFf1zSDK;Lcom/appsflyer/internal/AFd1fSDK;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1}, Lcom/appsflyer/internal/AFd1fSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFe1sSDK;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/appsflyer/internal/AFg1gSDK;->copydefault:Lcom/appsflyer/internal/AFe1sSDK;

    .line 19
    .line 20
    invoke-interface {p1}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/appsflyer/internal/AFg1gSDK;->toString:Lcom/appsflyer/internal/AFd1rSDK;

    .line 25
    .line 26
    invoke-interface {p1}, Lcom/appsflyer/internal/AFd1fSDK;->component4()Lcom/appsflyer/internal/AFh1qSDK;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/appsflyer/internal/AFg1gSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 31
    .line 32
    invoke-interface {p1}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/appsflyer/internal/AFg1gSDK;->copy:Lcom/appsflyer/internal/AFd1pSDK;

    .line 37
    .line 38
    sget-object p1, Lcom/appsflyer/internal/AFf1zSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFf1zSDK;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1wSDK;->getMonetizationNetwork:Ljava/util/Set;

    .line 41
    .line 42
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    sget-object p1, Lcom/appsflyer/internal/AFf1zSDK;->hashCode:Lcom/appsflyer/internal/AFf1zSDK;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1wSDK;->getMonetizationNetwork:Ljava/util/Set;

    .line 48
    .line 49
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public final AFAdRevenueData(Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1gSDK;->toString:Lcom/appsflyer/internal/AFd1rSDK;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/appsflyer/internal/AFg1gSDK;->copy:Lcom/appsflyer/internal/AFd1pSDK;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFd1pSDK;->component4()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    long-to-int v1, v1

    .line 18
    const v2, -0x2eea7324

    .line 19
    .line 20
    .line 21
    const v3, 0x2eea733c

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_1

    .line 41
    .line 42
    sget-object v1, Lcom/appsflyer/internal/AFg1gSDK;->component3:Ljava/util/List;

    .line 43
    .line 44
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_0

    .line 57
    .line 58
    const-string v1, "-"

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    const-string v1, "[GCD] AF detected using redundant Google-Play channel for attribution - %s. Using without channel postfix."

    .line 66
    .line 67
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    const-string v0, ""

    .line 79
    .line 80
    :goto_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1gSDK;->copydefault:Lcom/appsflyer/internal/AFe1sSDK;

    .line 81
    .line 82
    invoke-virtual {p0, v0, p1}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    new-instance p1, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v0, "[GCD-B01] URL: "

    .line 89
    .line 90
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1rSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1jSDK;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/appsflyer/internal/AFe1jSDK;->getRevenue:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-static {p1}, Lcom/appsflyer/internal/AFb1kSDK;->getMediationNetwork(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return-object p0
.end method

.method public final AFAdRevenueData()Z
    .locals 0

    .line 108
    const/4 p0, 0x0

    return p0
.end method

.method public final component1()Lcom/appsflyer/attribution/AppsFlyerRequestListener;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public final equals()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final getCurrencyIso4217Code()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/appsflyer/internal/AFf1oSDK;->getCurrencyIso4217Code()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1gSDK;->equals:Ljava/util/Map;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1gSDK;->valueOf:Ljava/lang/String;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {v0}, Lcom/appsflyer/internal/AFg1hSDK;->AFAdRevenueData(Ljava/util/Map;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-static {p0}, Lcom/appsflyer/internal/AFg1hSDK;->getMediationNetwork(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    const-string p0, "Unknown error"

    .line 27
    .line 28
    invoke-static {p0}, Lcom/appsflyer/internal/AFg1hSDK;->getMediationNetwork(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final getMonetizationNetwork()Lcom/appsflyer/internal/AFe1dSDK;
    .locals 13
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v0, "is_first_launch"

    .line 2
    .line 3
    const-string v1, "af_channel"

    .line 4
    .line 5
    const-string v2, "af_siteid"

    .line 6
    .line 7
    const-string v3, "[GCD-A03] Server retrieving attempt finished"

    .line 8
    .line 9
    iget-object v4, p0, Lcom/appsflyer/internal/AFf1oSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 10
    .line 11
    invoke-virtual {v4}, Lcom/appsflyer/internal/AFg1rSDK;->getMonetizationNetwork()Z

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-nez v4, :cond_f

    .line 16
    .line 17
    sget-object v4, Lcom/appsflyer/internal/AFe1dSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1dSDK;

    .line 18
    .line 19
    const/4 v5, 0x0

    .line 20
    move v6, v5

    .line 21
    :goto_0
    const/4 v7, 0x2

    .line 22
    if-gt v6, v7, :cond_e

    .line 23
    .line 24
    const/4 v4, 0x1

    .line 25
    if-lt v6, v7, :cond_0

    .line 26
    .line 27
    move v7, v4

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    move v7, v5

    .line 30
    :goto_1
    iget-object v8, p0, Lcom/appsflyer/internal/AFg1gSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 31
    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v9

    .line 36
    iput-wide v9, v8, Lcom/appsflyer/internal/AFh1qSDK;->equals:J

    .line 37
    .line 38
    :try_start_0
    invoke-super {p0}, Lcom/appsflyer/internal/AFf1oSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFe1dSDK;

    .line 39
    .line 40
    .line 41
    move-result-object v8

    .line 42
    iget-object v9, p0, Lcom/appsflyer/internal/AFf1oSDK;->component1:Lcom/appsflyer/internal/AFe1kSDK;

    .line 43
    .line 44
    if-nez v9, :cond_1

    .line 45
    .line 46
    goto/16 :goto_9

    .line 47
    .line 48
    :cond_1
    invoke-virtual {v9}, Lcom/appsflyer/internal/AFe1kSDK;->getStatusCode()I

    .line 49
    .line 50
    .line 51
    move-result v10

    .line 52
    const/16 v11, 0x193

    .line 53
    .line 54
    if-eq v10, v11, :cond_3

    .line 55
    .line 56
    const/16 v11, 0x1f4

    .line 57
    .line 58
    if-lt v10, v11, :cond_2

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_2
    move v4, v5

    .line 62
    :cond_3
    :goto_2
    invoke-virtual {v9}, Lcom/appsflyer/internal/AFe1kSDK;->isSuccessful()Z

    .line 63
    .line 64
    .line 65
    move-result v11

    .line 66
    const/16 v12, 0x194

    .line 67
    .line 68
    if-nez v11, :cond_6

    .line 69
    .line 70
    if-ne v10, v12, :cond_4

    .line 71
    .line 72
    goto :goto_6

    .line 73
    :cond_4
    if-nez v7, :cond_5

    .line 74
    .line 75
    if-nez v4, :cond_c

    .line 76
    .line 77
    goto :goto_4

    .line 78
    :goto_3
    move-object v4, v8

    .line 79
    goto/16 :goto_a

    .line 80
    .line 81
    :cond_5
    :goto_4
    const-string v4, "Error connection to server: "

    .line 82
    .line 83
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v8

    .line 87
    invoke-virtual {v4, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    iput-object v4, p0, Lcom/appsflyer/internal/AFg1gSDK;->valueOf:Ljava/lang/String;

    .line 92
    .line 93
    sget-object v0, Lcom/appsflyer/internal/AFe1dSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1dSDK;
    :try_end_0
    .catch Lcom/appsflyer/internal/AFf1ySDK; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    .line 95
    :goto_5
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1gSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 96
    .line 97
    invoke-virtual {p0, v6}, Lcom/appsflyer/internal/AFh1qSDK;->getMonetizationNetwork(I)V

    .line 98
    .line 99
    .line 100
    invoke-static {v3}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-object v0

    .line 104
    :catchall_0
    move-exception v0

    .line 105
    goto/16 :goto_c

    .line 106
    .line 107
    :catch_0
    move-exception v4

    .line 108
    goto/16 :goto_8

    .line 109
    .line 110
    :catch_1
    move-exception v0

    .line 111
    goto/16 :goto_b

    .line 112
    .line 113
    :cond_6
    :goto_6
    :try_start_1
    invoke-virtual {v9}, Lcom/appsflyer/internal/AFe1kSDK;->getBody()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    check-cast v4, Ljava/util/Map;

    .line 118
    .line 119
    invoke-virtual {v9}, Lcom/appsflyer/internal/AFe1kSDK;->getStatusCode()I

    .line 120
    .line 121
    .line 122
    move-result v8

    .line 123
    const-string v9, "iscache"

    .line 124
    .line 125
    invoke-interface {v4, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v9

    .line 129
    check-cast v9, Ljava/lang/Boolean;

    .line 130
    .line 131
    if-ne v8, v12, :cond_7

    .line 132
    .line 133
    const-string v8, "error_reason"

    .line 134
    .line 135
    invoke-interface {v4, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    const-string v8, "status_code"

    .line 139
    .line 140
    invoke-interface {v4, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    const-string v8, "af_status"

    .line 144
    .line 145
    const-string v10, "Organic"

    .line 146
    .line 147
    invoke-interface {v4, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    const-string v8, "af_message"

    .line 151
    .line 152
    const-string v10, "organic install"

    .line 153
    .line 154
    invoke-interface {v4, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    :cond_7
    if-eqz v9, :cond_8

    .line 158
    .line 159
    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    .line 160
    .line 161
    .line 162
    move-result v8

    .line 163
    if-nez v8, :cond_8

    .line 164
    .line 165
    iget-object v8, p0, Lcom/appsflyer/internal/AFg1gSDK;->toString:Lcom/appsflyer/internal/AFd1rSDK;

    .line 166
    .line 167
    const-string v9, "appsflyerConversionDataCacheExpiration"

    .line 168
    .line 169
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 170
    .line 171
    .line 172
    move-result-wide v10

    .line 173
    invoke-interface {v8, v9, v10, v11}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;J)V

    .line 174
    .line 175
    .line 176
    :cond_8
    invoke-interface {v4, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result v8

    .line 180
    if-eqz v8, :cond_a

    .line 181
    .line 182
    invoke-interface {v4, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v8

    .line 186
    if-eqz v8, :cond_9

    .line 187
    .line 188
    new-instance v8, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    const-string v9, "[Invite] Detected App-Invite via channel: "

    .line 191
    .line 192
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v9

    .line 199
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v8

    .line 206
    invoke-static {v8}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    goto :goto_7

    .line 210
    :cond_9
    const-string v8, "[CrossPromotion] App was installed via %s\'s Cross Promotion"

    .line 211
    .line 212
    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v9

    .line 216
    filled-new-array {v9}, [Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v9

    .line 220
    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v8

    .line 224
    invoke-static {v8}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    :cond_a
    :goto_7
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 228
    .line 229
    invoke-interface {v4, v0, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    new-instance v8, Lorg/json/JSONObject;

    .line 233
    .line 234
    invoke-direct {v8, v4}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v8

    .line 241
    iget-object v9, p0, Lcom/appsflyer/internal/AFg1gSDK;->toString:Lcom/appsflyer/internal/AFd1rSDK;

    .line 242
    .line 243
    const-string v10, "attributionId"

    .line 244
    .line 245
    invoke-interface {v9, v10, v8}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    iget-object v8, p0, Lcom/appsflyer/internal/AFg1gSDK;->toString:Lcom/appsflyer/internal/AFd1rSDK;

    .line 249
    .line 250
    const-string v9, "sixtyDayConversionData"

    .line 251
    .line 252
    invoke-interface {v8, v9}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;)Z

    .line 253
    .line 254
    .line 255
    move-result v8

    .line 256
    if-nez v8, :cond_b

    .line 257
    .line 258
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 259
    .line 260
    invoke-interface {v4, v0, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    :cond_b
    iput-object v4, p0, Lcom/appsflyer/internal/AFg1gSDK;->equals:Ljava/util/Map;

    .line 264
    .line 265
    sget-object v0, Lcom/appsflyer/internal/AFe1dSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;
    :try_end_1
    .catch Lcom/appsflyer/internal/AFf1ySDK; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 266
    .line 267
    goto/16 :goto_5

    .line 268
    .line 269
    :goto_8
    :try_start_2
    new-instance v8, Ljava/lang/StringBuilder;

    .line 270
    .line 271
    const-string v9, "[GCD] Error: "

    .line 272
    .line 273
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v4}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v9

    .line 280
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v8

    .line 287
    invoke-static {v8, v4, v5, v5}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;ZZ)V

    .line 288
    .line 289
    .line 290
    sget-object v8, Lcom/appsflyer/internal/AFe1dSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1dSDK;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 291
    .line 292
    if-nez v7, :cond_d

    .line 293
    .line 294
    :cond_c
    :goto_9
    iget-object v4, p0, Lcom/appsflyer/internal/AFg1gSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 295
    .line 296
    invoke-virtual {v4, v6}, Lcom/appsflyer/internal/AFh1qSDK;->getMonetizationNetwork(I)V

    .line 297
    .line 298
    .line 299
    invoke-static {v3}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    goto/16 :goto_3

    .line 303
    .line 304
    :goto_a
    add-int/lit8 v6, v6, 0x1

    .line 305
    .line 306
    goto/16 :goto_0

    .line 307
    .line 308
    :cond_d
    :try_start_3
    invoke-virtual {v4}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    iput-object v0, p0, Lcom/appsflyer/internal/AFg1gSDK;->valueOf:Ljava/lang/String;

    .line 313
    .line 314
    throw v4

    .line 315
    :goto_b
    const-string v1, "[GCD-E05] AppsFlyer dev key is missing"

    .line 316
    .line 317
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    const-string v1, "AppsFlyer dev key is missing"

    .line 321
    .line 322
    iput-object v1, p0, Lcom/appsflyer/internal/AFg1gSDK;->valueOf:Ljava/lang/String;

    .line 323
    .line 324
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 325
    :goto_c
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1gSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 326
    .line 327
    invoke-virtual {p0, v6}, Lcom/appsflyer/internal/AFh1qSDK;->getMonetizationNetwork(I)V

    .line 328
    .line 329
    .line 330
    invoke-static {v3}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 331
    .line 332
    .line 333
    throw v0

    .line 334
    :cond_e
    return-object v4

    .line 335
    :cond_f
    const-string v0, "[GCD-E03] \'isStopTracking\' enabled"

    .line 336
    .line 337
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    const-string v0, "\'isStopTracking\' enabled"

    .line 341
    .line 342
    iput-object v0, p0, Lcom/appsflyer/internal/AFg1gSDK;->valueOf:Ljava/lang/String;

    .line 343
    .line 344
    new-instance p0, Lcom/appsflyer/internal/AFf1uSDK;

    .line 345
    .line 346
    invoke-direct {p0}, Lcom/appsflyer/internal/AFf1uSDK;-><init>()V

    .line 347
    .line 348
    .line 349
    throw p0
.end method
