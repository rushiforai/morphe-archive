.class final Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/internal/AFe1eSDK;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/AFb1tSDK;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AFa1vSDK"
.end annotation


# instance fields
.field private synthetic getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1tSDK;


# direct methods
.method private constructor <init>(Lcom/appsflyer/internal/AFb1tSDK;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1tSDK;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/appsflyer/internal/AFb1tSDK;B)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;-><init>(Lcom/appsflyer/internal/AFb1tSDK;)V

    return-void
.end method

.method private getMediationNetwork()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1tSDK;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork:Lcom/appsflyer/AppsFlyerConversionListener;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method


# virtual methods
.method public final getCurrencyIso4217Code(Lcom/appsflyer/internal/AFf1wSDK;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/AFf1wSDK<",
            "*>;)V"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/appsflyer/internal/AFf1dSDK;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/appsflyer/internal/AFf1gSDK;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1tSDK;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->component4()Lcom/appsflyer/internal/AFh1qSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p1, p1, Lcom/appsflyer/internal/AFf1gSDK;->component3:Lcom/appsflyer/internal/AFa1mSDK;

    .line 18
    .line 19
    iget p1, p1, Lcom/appsflyer/internal/AFa1mSDK;->areAllFieldsValid:I

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFh1qSDK;->getRevenue(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final getMonetizationNetwork(Lcom/appsflyer/internal/AFf1wSDK;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/AFf1wSDK<",
            "*>;)V"
        }
    .end annotation

    .line 234
    return-void
.end method

.method public final getMonetizationNetwork(Lcom/appsflyer/internal/AFf1wSDK;Lcom/appsflyer/internal/AFe1dSDK;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/AFf1wSDK<",
            "*>;",
            "Lcom/appsflyer/internal/AFe1dSDK;",
            ")V"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/appsflyer/internal/AFf1gSDK;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/appsflyer/internal/AFf1gSDK;

    .line 7
    .line 8
    instance-of v1, p1, Lcom/appsflyer/internal/AFf1dSDK;

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;->getMediationNetwork()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    move-object v2, p1

    .line 19
    check-cast v2, Lcom/appsflyer/internal/AFf1dSDK;

    .line 20
    .line 21
    iget-object v3, v2, Lcom/appsflyer/internal/AFf1wSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 22
    .line 23
    sget-object v4, Lcom/appsflyer/internal/AFe1dSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 24
    .line 25
    if-eq v3, v4, :cond_0

    .line 26
    .line 27
    iget v3, v2, Lcom/appsflyer/internal/AFf1wSDK;->getRevenue:I

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    if-ne v3, v4, :cond_1

    .line 31
    .line 32
    :cond_0
    new-instance v3, Lcom/appsflyer/internal/AFg1dSDK;

    .line 33
    .line 34
    iget-object v4, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1tSDK;

    .line 35
    .line 36
    invoke-virtual {v4}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-interface {v4}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-direct {v3, v2, v4}, Lcom/appsflyer/internal/AFg1dSDK;-><init>(Lcom/appsflyer/internal/AFf1dSDK;Lcom/appsflyer/internal/AFd1rSDK;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1tSDK;

    .line 48
    .line 49
    invoke-virtual {v2}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-interface {v2}, Lcom/appsflyer/internal/AFd1fSDK;->copy()Lcom/appsflyer/internal/AFe1aSDK;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iget-object v4, v2, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 58
    .line 59
    new-instance v5, Lcom/appsflyer/internal/AFe1aSDK$5;

    .line 60
    .line 61
    invoke-direct {v5, v2, v3}, Lcom/appsflyer/internal/AFe1aSDK$5;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V

    .line 62
    .line 63
    .line 64
    invoke-interface {v4, v5}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    sget-object v2, Lcom/appsflyer/internal/AFe1dSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 68
    .line 69
    if-ne p2, v2, :cond_5

    .line 70
    .line 71
    iget-object p2, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1tSDK;

    .line 72
    .line 73
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 78
    .line 79
    .line 80
    move-result-wide v3

    .line 81
    long-to-int v3, v3

    .line 82
    const v4, 0x36fc586b

    .line 83
    .line 84
    .line 85
    const v5, -0x36fc5864    # -539257.75f

    .line 86
    .line 87
    .line 88
    invoke-static {v2, v4, v5, v3}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, Landroid/app/Application;

    .line 93
    .line 94
    invoke-virtual {p2, v2}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Landroid/content/Context;)Lcom/appsflyer/internal/AFd1rSDK;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    const-string v2, "sentSuccessfully"

    .line 99
    .line 100
    const-string v3, "true"

    .line 101
    .line 102
    invoke-interface {p2, v2, v3}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    instance-of p1, p1, Lcom/appsflyer/internal/AFf1bSDK;

    .line 106
    .line 107
    if-nez p1, :cond_2

    .line 108
    .line 109
    new-instance p1, Lcom/appsflyer/internal/AFg1lSDK;

    .line 110
    .line 111
    iget-object p2, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1tSDK;

    .line 112
    .line 113
    invoke-static {p2}, Lcom/appsflyer/internal/AFb1tSDK;->k_(Lcom/appsflyer/internal/AFb1tSDK;)Landroid/app/Application;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-direct {p1, p2}, Lcom/appsflyer/internal/AFg1lSDK;-><init>(Landroid/content/Context;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFg1lSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFg1jSDK;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    if-eqz p1, :cond_2

    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFg1jSDK;->getRevenue()Z

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    if-eqz p2, :cond_2

    .line 131
    .line 132
    iget-object p1, p1, Lcom/appsflyer/internal/AFg1jSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 133
    .line 134
    sget-object p2, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 135
    .line 136
    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->unregisterClient:Lcom/appsflyer/internal/AFg1cSDK;

    .line 137
    .line 138
    const-string v3, "Resending Uninstall token to AF servers: "

    .line 139
    .line 140
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-virtual {p2, v2, v3}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-static {p1}, Lcom/appsflyer/internal/AFg1lSDK;->AFAdRevenueData(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :cond_2
    iget-object p1, v0, Lcom/appsflyer/internal/AFf1oSDK;->component1:Lcom/appsflyer/internal/AFe1kSDK;

    .line 155
    .line 156
    if-eqz p1, :cond_3

    .line 157
    .line 158
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFe1kSDK;->getBody()Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    check-cast p1, Ljava/lang/String;

    .line 163
    .line 164
    invoke-static {p1}, Lcom/appsflyer/internal/AFc1uSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    if-eqz p1, :cond_3

    .line 169
    .line 170
    iget-object p2, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1tSDK;

    .line 171
    .line 172
    const-string v0, "send_background"

    .line 173
    .line 174
    const/4 v2, 0x0

    .line 175
    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    invoke-static {p2, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFb1tSDK;Z)Z

    .line 180
    .line 181
    .line 182
    :cond_3
    if-eqz v1, :cond_5

    .line 183
    .line 184
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1tSDK;

    .line 185
    .line 186
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 187
    .line 188
    .line 189
    move-result-wide p1

    .line 190
    invoke-static {p0, p1, p2}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFb1tSDK;J)J

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_4
    instance-of p1, p1, Lcom/appsflyer/internal/AFg1dSDK;

    .line 195
    .line 196
    if-eqz p1, :cond_5

    .line 197
    .line 198
    sget-object p1, Lcom/appsflyer/internal/AFe1dSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 199
    .line 200
    if-eq p2, p1, :cond_5

    .line 201
    .line 202
    new-instance p1, Lcom/appsflyer/internal/AFg1gSDK;

    .line 203
    .line 204
    iget-object p2, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1tSDK;

    .line 205
    .line 206
    invoke-virtual {p2}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    invoke-direct {p1, p2}, Lcom/appsflyer/internal/AFg1gSDK;-><init>(Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 211
    .line 212
    .line 213
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1tSDK;

    .line 214
    .line 215
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copy()Lcom/appsflyer/internal/AFe1aSDK;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    iget-object p2, p0, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 224
    .line 225
    new-instance v0, Lcom/appsflyer/internal/AFe1aSDK$5;

    .line 226
    .line 227
    invoke-direct {v0, p0, p1}, Lcom/appsflyer/internal/AFe1aSDK$5;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V

    .line 228
    .line 229
    .line 230
    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 231
    .line 232
    .line 233
    :cond_5
    return-void
.end method
