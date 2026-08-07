.class public final Lcom/appsflyer/internal/AFf1dSDK;
.super Lcom/appsflyer/internal/AFf1gSDK;
.source "SourceFile"


# instance fields
.field private final AFInAppEventParameterName:Lcom/appsflyer/internal/AFc1oSDK;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private final AFInAppEventType:Lcom/appsflyer/internal/AFh1qSDK;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private final AFKeystoreWrapper:Lcom/appsflyer/internal/AFi1mSDK;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final copydefault:Lcom/appsflyer/internal/AFd1rSDK;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private final equals:Lcom/appsflyer/internal/AFj1vSDK;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public hashCode:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final valueOf:Lcom/appsflyer/internal/AFg1wSDK;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private final values:Lcom/appsflyer/AppsFlyerProperties;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFd1fSDK;)V
    .locals 0
    .param p1    # Lcom/appsflyer/internal/AFa1mSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/appsflyer/internal/AFd1fSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/AFf1gSDK;-><init>(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->equals()Lcom/appsflyer/internal/AFj1vSDK;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1dSDK;->equals:Lcom/appsflyer/internal/AFj1vSDK;

    .line 9
    .line 10
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1dSDK;->copydefault:Lcom/appsflyer/internal/AFd1rSDK;

    .line 15
    .line 16
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->component4()Lcom/appsflyer/internal/AFh1qSDK;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1dSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFh1qSDK;

    .line 21
    .line 22
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->component2()Lcom/appsflyer/internal/AFg1wSDK;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1dSDK;->valueOf:Lcom/appsflyer/internal/AFg1wSDK;

    .line 27
    .line 28
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1dSDK;->values:Lcom/appsflyer/AppsFlyerProperties;

    .line 33
    .line 34
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->w()Lcom/appsflyer/internal/AFc1oSDK;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1dSDK;->AFInAppEventParameterName:Lcom/appsflyer/internal/AFc1oSDK;

    .line 39
    .line 40
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->afInfoLog()Lcom/appsflyer/internal/AFi1mSDK;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1dSDK;->AFKeystoreWrapper:Lcom/appsflyer/internal/AFi1mSDK;

    .line 45
    .line 46
    sget-object p1, Lcom/appsflyer/internal/AFf1zSDK;->component4:Lcom/appsflyer/internal/AFf1zSDK;

    .line 47
    .line 48
    iget-object p2, p0, Lcom/appsflyer/internal/AFf1wSDK;->getMonetizationNetwork:Ljava/util/Set;

    .line 49
    .line 50
    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    sget-object p1, Lcom/appsflyer/internal/AFf1zSDK;->component3:Lcom/appsflyer/internal/AFf1zSDK;

    .line 54
    .line 55
    iget-object p2, p0, Lcom/appsflyer/internal/AFf1wSDK;->getMonetizationNetwork:Ljava/util/Set;

    .line 56
    .line 57
    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/appsflyer/internal/AFf1wSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFf1zSDK;

    .line 61
    .line 62
    sget-object p2, Lcom/appsflyer/internal/AFf1zSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFf1zSDK;

    .line 63
    .line 64
    if-ne p1, p2, :cond_0

    .line 65
    .line 66
    sget-object p1, Lcom/appsflyer/internal/AFf1zSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFf1zSDK;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1wSDK;->getMonetizationNetwork:Ljava/util/Set;

    .line 69
    .line 70
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method


# virtual methods
.method public final getCurrencyIso4217Code()V
    .locals 7

    .line 1
    invoke-super {p0}, Lcom/appsflyer/internal/AFf1oSDK;->getCurrencyIso4217Code()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1dSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFh1qSDK;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1gSDK;->component3:Lcom/appsflyer/internal/AFa1mSDK;

    .line 7
    .line 8
    iget p0, p0, Lcom/appsflyer/internal/AFa1mSDK;->areAllFieldsValid:I

    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    const/4 v3, 0x1

    .line 15
    if-ne p0, v3, :cond_1

    .line 16
    .line 17
    iget-wide v3, v0, Lcom/appsflyer/internal/AFh1qSDK;->component2:J

    .line 18
    .line 19
    const-wide/16 v5, 0x0

    .line 20
    .line 21
    cmp-long p0, v3, v5

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, v0, Lcom/appsflyer/internal/AFh1qSDK;->getRevenue:Ljava/util/Map;

    .line 26
    .line 27
    sub-long/2addr v1, v3

    .line 28
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "net"

    .line 33
    .line 34
    invoke-interface {p0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    iget-object p0, v0, Lcom/appsflyer/internal/AFh1qSDK;->getRevenue:Ljava/util/Map;

    .line 38
    .line 39
    new-instance v1, Lorg/json/JSONObject;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, v0, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1rSDK;

    .line 45
    .line 46
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "first_launch"

    .line 51
    .line 52
    invoke-interface {p0, v1, v0}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    const-string p0, "Metrics: launch start ts is missing"

    .line 57
    .line 58
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public final getRevenue(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 11

    .line 1
    invoke-super {p0, p1}, Lcom/appsflyer/internal/AFf1gSDK;->getRevenue(Lcom/appsflyer/internal/AFa1mSDK;)V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Lcom/appsflyer/internal/AFa1mSDK;->areAllFieldsValid:I

    .line 5
    .line 6
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1dSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFh1qSDK;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Lcom/appsflyer/internal/AFh1qSDK;->getRevenue(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "meta"

    .line 16
    .line 17
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/util/Map;

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    new-instance v1, Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-interface {v3, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const-string v4, "af_deeplink"

    .line 42
    .line 43
    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-nez v3, :cond_1

    .line 48
    .line 49
    iget-object v3, p0, Lcom/appsflyer/internal/AFf1dSDK;->AFInAppEventParameterName:Lcom/appsflyer/internal/AFc1oSDK;

    .line 50
    .line 51
    invoke-interface {v3}, Lcom/appsflyer/internal/AFc1oSDK;->getMonetizationNetwork()Ljava/util/Map;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {p1, v3}, Lcom/appsflyer/internal/AFa1mSDK;->getMediationNetwork(Ljava/util/Map;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-object v3, p0, Lcom/appsflyer/internal/AFf1dSDK;->valueOf:Lcom/appsflyer/internal/AFg1wSDK;

    .line 59
    .line 60
    invoke-virtual {v3}, Lcom/appsflyer/internal/AFg1wSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFh1dSDK;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    if-eqz v3, :cond_9

    .line 65
    .line 66
    new-instance v4, Ljava/util/HashMap;

    .line 67
    .line 68
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v5, "cdn_token"

    .line 72
    .line 73
    iget-object v6, v3, Lcom/appsflyer/internal/AFh1dSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 74
    .line 75
    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    iget-object v5, v3, Lcom/appsflyer/internal/AFh1dSDK;->getMediationNetwork:Ljava/lang/String;

    .line 79
    .line 80
    if-eqz v5, :cond_2

    .line 81
    .line 82
    const-string v6, "c_ver"

    .line 83
    .line 84
    invoke-interface {v4, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    :cond_2
    iget-wide v5, v3, Lcom/appsflyer/internal/AFh1dSDK;->getCurrencyIso4217Code:J

    .line 88
    .line 89
    const-wide/16 v7, 0x0

    .line 90
    .line 91
    cmp-long v9, v5, v7

    .line 92
    .line 93
    if-lez v9, :cond_3

    .line 94
    .line 95
    const-string v9, "latency"

    .line 96
    .line 97
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    invoke-interface {v4, v9, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    :cond_3
    iget-wide v5, v3, Lcom/appsflyer/internal/AFh1dSDK;->AFAdRevenueData:J

    .line 105
    .line 106
    cmp-long v7, v5, v7

    .line 107
    .line 108
    if-lez v7, :cond_4

    .line 109
    .line 110
    const-string v7, "delay"

    .line 111
    .line 112
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    invoke-interface {v4, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    :cond_4
    iget v5, v3, Lcom/appsflyer/internal/AFh1dSDK;->getRevenue:I

    .line 120
    .line 121
    if-lez v5, :cond_5

    .line 122
    .line 123
    const-string v6, "res_code"

    .line 124
    .line 125
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    invoke-interface {v4, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    :cond_5
    iget-object v5, v3, Lcom/appsflyer/internal/AFh1dSDK;->areAllFieldsValid:Ljava/lang/Throwable;

    .line 133
    .line 134
    if-eqz v5, :cond_6

    .line 135
    .line 136
    new-instance v5, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .line 140
    .line 141
    iget-object v6, v3, Lcom/appsflyer/internal/AFh1dSDK;->areAllFieldsValid:Ljava/lang/Throwable;

    .line 142
    .line 143
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 144
    .line 145
    .line 146
    move-result-object v6

    .line 147
    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v6

    .line 151
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    const-string v6, ": "

    .line 155
    .line 156
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    iget-object v6, v3, Lcom/appsflyer/internal/AFh1dSDK;->areAllFieldsValid:Ljava/lang/Throwable;

    .line 160
    .line 161
    invoke-virtual {v6}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v6

    .line 165
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    const-string v6, "error"

    .line 173
    .line 174
    invoke-interface {v4, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    :cond_6
    iget-object v5, v3, Lcom/appsflyer/internal/AFh1dSDK;->component2:Lcom/appsflyer/internal/AFi1uSDK;

    .line 178
    .line 179
    if-eqz v5, :cond_7

    .line 180
    .line 181
    const-string v6, "sig"

    .line 182
    .line 183
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v5

    .line 187
    invoke-interface {v4, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    :cond_7
    iget-object v3, v3, Lcom/appsflyer/internal/AFh1dSDK;->component1:Ljava/lang/String;

    .line 191
    .line 192
    if-eqz v3, :cond_8

    .line 193
    .line 194
    const-string v5, "cdn_cache_status"

    .line 195
    .line 196
    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    :cond_8
    const-string v3, "rc"

    .line 200
    .line 201
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    :cond_9
    iget-object v3, p0, Lcom/appsflyer/internal/AFf1gSDK;->copy:Lcom/appsflyer/internal/AFg1fSDK;

    .line 205
    .line 206
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    invoke-interface {v3, v4}, Lcom/appsflyer/internal/AFg1fSDK;->getMediationNetwork(Ljava/util/Map;)V

    .line 211
    .line 212
    .line 213
    const/4 v3, 0x0

    .line 214
    const-string v4, "first_launch"

    .line 215
    .line 216
    const/4 v5, 0x2

    .line 217
    const/4 v6, 0x1

    .line 218
    if-eq v0, v6, :cond_c

    .line 219
    .line 220
    if-eq v0, v5, :cond_a

    .line 221
    .line 222
    goto :goto_0

    .line 223
    :cond_a
    iget-object v7, p0, Lcom/appsflyer/internal/AFf1dSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFh1qSDK;

    .line 224
    .line 225
    new-instance v8, Ljava/util/HashMap;

    .line 226
    .line 227
    iget-object v7, v7, Lcom/appsflyer/internal/AFh1qSDK;->getRevenue:Ljava/util/Map;

    .line 228
    .line 229
    invoke-direct {v8, v7}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 230
    .line 231
    .line 232
    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    .line 233
    .line 234
    .line 235
    move-result v7

    .line 236
    if-nez v7, :cond_b

    .line 237
    .line 238
    invoke-interface {v1, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    :cond_b
    iget-object v7, p0, Lcom/appsflyer/internal/AFf1dSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFh1qSDK;

    .line 242
    .line 243
    iget-object v7, v7, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1rSDK;

    .line 244
    .line 245
    invoke-interface {v7, v4}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    goto :goto_0

    .line 249
    :cond_c
    iget-object v7, p0, Lcom/appsflyer/internal/AFf1dSDK;->values:Lcom/appsflyer/AppsFlyerProperties;

    .line 250
    .line 251
    const-string v8, "waitForCustomerId"

    .line 252
    .line 253
    invoke-virtual {v7, v8, v3}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 254
    .line 255
    .line 256
    move-result v7

    .line 257
    if-eqz v7, :cond_d

    .line 258
    .line 259
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 260
    .line 261
    .line 262
    move-result-object v7

    .line 263
    const-string v8, "wait_cid"

    .line 264
    .line 265
    invoke-static {v6}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v9

    .line 269
    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    :cond_d
    iget-object v7, p0, Lcom/appsflyer/internal/AFf1dSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFh1qSDK;

    .line 273
    .line 274
    new-instance v8, Ljava/util/HashMap;

    .line 275
    .line 276
    iget-object v7, v7, Lcom/appsflyer/internal/AFh1qSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 277
    .line 278
    invoke-direct {v8, v7}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 279
    .line 280
    .line 281
    iget-object v7, p0, Lcom/appsflyer/internal/AFf1dSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFh1qSDK;

    .line 282
    .line 283
    iget-object v7, v7, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1rSDK;

    .line 284
    .line 285
    const-string v9, "ddl"

    .line 286
    .line 287
    invoke-interface {v7, v9}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    .line 291
    .line 292
    .line 293
    move-result v7

    .line 294
    if-nez v7, :cond_e

    .line 295
    .line 296
    invoke-interface {v1, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    :cond_e
    iget-object v7, p0, Lcom/appsflyer/internal/AFf1dSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFh1qSDK;

    .line 300
    .line 301
    new-instance v8, Ljava/util/HashMap;

    .line 302
    .line 303
    iget-object v7, v7, Lcom/appsflyer/internal/AFh1qSDK;->getRevenue:Ljava/util/Map;

    .line 304
    .line 305
    invoke-direct {v8, v7}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 306
    .line 307
    .line 308
    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    .line 309
    .line 310
    .line 311
    move-result v7

    .line 312
    if-nez v7, :cond_f

    .line 313
    .line 314
    invoke-interface {v1, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    :cond_f
    :goto_0
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    if-eqz v1, :cond_10

    .line 322
    .line 323
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    :cond_10
    if-gt v0, v5, :cond_1b

    .line 331
    .line 332
    new-instance v1, Ljava/util/ArrayList;

    .line 333
    .line 334
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 335
    .line 336
    .line 337
    iget-object v2, p0, Lcom/appsflyer/internal/AFf1dSDK;->equals:Lcom/appsflyer/internal/AFj1vSDK;

    .line 338
    .line 339
    invoke-virtual {v2}, Lcom/appsflyer/internal/AFj1vSDK;->AFAdRevenueData()[Lcom/appsflyer/internal/AFj1zSDK;

    .line 340
    .line 341
    .line 342
    move-result-object v2

    .line 343
    array-length v4, v2

    .line 344
    :goto_1
    if-ge v3, v4, :cond_15

    .line 345
    .line 346
    aget-object v7, v2, v3

    .line 347
    .line 348
    instance-of v8, v7, Lcom/appsflyer/internal/AFi1gSDK;

    .line 349
    .line 350
    sget-object v9, Lcom/appsflyer/internal/AFf1dSDK$2;->getMediationNetwork:[I

    .line 351
    .line 352
    iget-object v10, v7, Lcom/appsflyer/internal/AFj1zSDK;->component3:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 353
    .line 354
    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    .line 355
    .line 356
    .line 357
    move-result v10

    .line 358
    aget v9, v9, v10

    .line 359
    .line 360
    if-eq v9, v6, :cond_12

    .line 361
    .line 362
    if-eq v9, v5, :cond_11

    .line 363
    .line 364
    goto :goto_2

    .line 365
    :cond_11
    if-ne v0, v5, :cond_14

    .line 366
    .line 367
    if-nez v8, :cond_14

    .line 368
    .line 369
    new-instance v8, Ljava/util/HashMap;

    .line 370
    .line 371
    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 372
    .line 373
    .line 374
    const-string v9, "source"

    .line 375
    .line 376
    iget-object v10, v7, Lcom/appsflyer/internal/AFj1zSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 377
    .line 378
    invoke-interface {v8, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    const-string v9, "response"

    .line 382
    .line 383
    const-string v10, "TIMEOUT"

    .line 384
    .line 385
    invoke-interface {v8, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    .line 387
    .line 388
    const-string v9, "type"

    .line 389
    .line 390
    iget-object v7, v7, Lcom/appsflyer/internal/AFj1zSDK;->component1:Ljava/lang/String;

    .line 391
    .line 392
    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 396
    .line 397
    .line 398
    goto :goto_2

    .line 399
    :cond_12
    if-eqz v8, :cond_13

    .line 400
    .line 401
    move-object v8, v7

    .line 402
    check-cast v8, Lcom/appsflyer/internal/AFi1gSDK;

    .line 403
    .line 404
    iget-object v8, v8, Lcom/appsflyer/internal/AFi1gSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 405
    .line 406
    const-string v9, "rfr"

    .line 407
    .line 408
    invoke-virtual {p1, v9, v8}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 409
    .line 410
    .line 411
    iget-object v8, p0, Lcom/appsflyer/internal/AFf1dSDK;->copydefault:Lcom/appsflyer/internal/AFd1rSDK;

    .line 412
    .line 413
    const-string v9, "newGPReferrerSent"

    .line 414
    .line 415
    invoke-interface {v8, v9, v6}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;Z)V

    .line 416
    .line 417
    .line 418
    :cond_13
    iget-object v7, v7, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 419
    .line 420
    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 421
    .line 422
    .line 423
    :cond_14
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 424
    .line 425
    goto :goto_1

    .line 426
    :cond_15
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 427
    .line 428
    .line 429
    move-result v0

    .line 430
    if-nez v0, :cond_16

    .line 431
    .line 432
    const-string v0, "referrers"

    .line 433
    .line 434
    invoke-virtual {p1, v0, v1}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 435
    .line 436
    .line 437
    :cond_16
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1dSDK;->hashCode:Ljava/util/Map;

    .line 438
    .line 439
    if-eqz v0, :cond_17

    .line 440
    .line 441
    const-string v1, "fb_ddl"

    .line 442
    .line 443
    invoke-virtual {p1, v1, v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 444
    .line 445
    .line 446
    :cond_17
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1wSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFf1zSDK;

    .line 447
    .line 448
    sget-object v1, Lcom/appsflyer/internal/AFf1zSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFf1zSDK;

    .line 449
    .line 450
    if-ne v0, v1, :cond_1b

    .line 451
    .line 452
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1dSDK;->AFKeystoreWrapper:Lcom/appsflyer/internal/AFi1mSDK;

    .line 453
    .line 454
    if-eqz v0, :cond_1a

    .line 455
    .line 456
    invoke-interface {v0}, Lcom/appsflyer/internal/AFi1mSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFi1kSDK;

    .line 457
    .line 458
    .line 459
    move-result-object v0

    .line 460
    if-eqz v0, :cond_1a

    .line 461
    .line 462
    new-instance v1, Ljava/util/HashMap;

    .line 463
    .line 464
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 465
    .line 466
    .line 467
    new-instance v2, Ljava/util/HashMap;

    .line 468
    .line 469
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 470
    .line 471
    .line 472
    iget-wide v3, v0, Lcom/appsflyer/internal/AFi1kSDK;->AFAdRevenueData:J

    .line 473
    .line 474
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 475
    .line 476
    .line 477
    move-result-object v3

    .line 478
    const-string v4, "pia_timestamp"

    .line 479
    .line 480
    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 481
    .line 482
    .line 483
    iget-wide v3, v0, Lcom/appsflyer/internal/AFi1kSDK;->getRevenue:J

    .line 484
    .line 485
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 486
    .line 487
    .line 488
    move-result-object v3

    .line 489
    const-string v4, "ttr_millis"

    .line 490
    .line 491
    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 492
    .line 493
    .line 494
    iget-object v3, v0, Lcom/appsflyer/internal/AFi1kSDK;->getMediationNetwork:Ljava/lang/String;

    .line 495
    .line 496
    if-eqz v3, :cond_18

    .line 497
    .line 498
    const-string v4, "pia_token"

    .line 499
    .line 500
    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 501
    .line 502
    .line 503
    :cond_18
    iget-object v0, v0, Lcom/appsflyer/internal/AFi1kSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 504
    .line 505
    if-eqz v0, :cond_19

    .line 506
    .line 507
    const-string v3, "error_code"

    .line 508
    .line 509
    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    .line 511
    .line 512
    :cond_19
    const-string v0, "pia"

    .line 513
    .line 514
    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    .line 516
    .line 517
    goto :goto_3

    .line 518
    :cond_1a
    const/4 v1, 0x0

    .line 519
    :goto_3
    if-eqz v1, :cond_1b

    .line 520
    .line 521
    invoke-virtual {p1, v1}, Lcom/appsflyer/internal/AFa1mSDK;->getMediationNetwork(Ljava/util/Map;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 522
    .line 523
    .line 524
    :cond_1b
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1gSDK;->copy:Lcom/appsflyer/internal/AFg1fSDK;

    .line 525
    .line 526
    invoke-interface {p0, p1}, Lcom/appsflyer/internal/AFg1fSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFa1mSDK;)V

    .line 527
    .line 528
    .line 529
    return-void
.end method
