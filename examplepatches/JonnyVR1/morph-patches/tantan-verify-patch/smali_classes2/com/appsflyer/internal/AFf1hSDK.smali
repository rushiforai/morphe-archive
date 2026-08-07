.class public final Lcom/appsflyer/internal/AFf1hSDK;
.super Lcom/appsflyer/internal/AFf1oSDK;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/AFf1hSDK$AFa1ySDK;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/appsflyer/internal/AFf1oSDK<",
        "Lcom/appsflyer/internal/AFc1jSDK;",
        ">;"
    }
.end annotation


# instance fields
.field private final AFInAppEventParameterName:Ljava/util/concurrent/CountDownLatch;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private AFInAppEventType:I

.field private AFKeystoreWrapper:I

.field private final component3:Lcom/appsflyer/internal/AFc1qSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final copy:Lcom/appsflyer/internal/AFc1sSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final copydefault:Lcom/appsflyer/internal/AFd1mSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final equals:Lcom/appsflyer/internal/AFj1vSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final hashCode:Lcom/appsflyer/internal/AFh1qSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final toString:Lcom/appsflyer/internal/AFd1pSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private valueOf:I

.field private final values:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/appsflyer/internal/AFj1zSDK;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFc1qSDK;Lcom/appsflyer/internal/AFd1fSDK;)V
    .locals 8
    .param p1    # Lcom/appsflyer/internal/AFc1qSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/appsflyer/internal/AFd1fSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/appsflyer/internal/AFf1zSDK;->component3:Lcom/appsflyer/internal/AFf1zSDK;

    .line 8
    .line 9
    sget-object v1, Lcom/appsflyer/internal/AFf1zSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFf1zSDK;

    .line 10
    .line 11
    sget-object v2, Lcom/appsflyer/internal/AFf1zSDK;->getRevenue:Lcom/appsflyer/internal/AFf1zSDK;

    .line 12
    .line 13
    filled-new-array {v1, v2}, [Lcom/appsflyer/internal/AFf1zSDK;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "DdlSdk"

    .line 18
    .line 19
    invoke-direct {p0, v0, v1, p2, v2}, Lcom/appsflyer/internal/AFf1oSDK;-><init>(Lcom/appsflyer/internal/AFf1zSDK;[Lcom/appsflyer/internal/AFf1zSDK;Lcom/appsflyer/internal/AFd1fSDK;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->component3:Lcom/appsflyer/internal/AFc1qSDK;

    .line 23
    .line 24
    new-instance p1, Ljava/util/concurrent/CountDownLatch;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-direct {p1, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->AFInAppEventParameterName:Ljava/util/concurrent/CountDownLatch;

    .line 31
    .line 32
    new-instance p1, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->values:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->toString:Lcom/appsflyer/internal/AFd1pSDK;

    .line 47
    .line 48
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->e()Lcom/appsflyer/internal/AFd1mSDK;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->copydefault:Lcom/appsflyer/internal/AFd1mSDK;

    .line 56
    .line 57
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    .line 63
    .line 64
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 65
    .line 66
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->component4()Lcom/appsflyer/internal/AFh1qSDK;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 74
    .line 75
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->equals()Lcom/appsflyer/internal/AFj1vSDK;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->equals:Lcom/appsflyer/internal/AFj1vSDK;

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFj1vSDK;->AFAdRevenueData()[Lcom/appsflyer/internal/AFj1zSDK;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 89
    .line 90
    .line 91
    new-instance p2, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    array-length v1, p1

    .line 97
    const/4 v2, 0x0

    .line 98
    :goto_0
    if-ge v2, v1, :cond_1

    .line 99
    .line 100
    aget-object v3, p1, v2

    .line 101
    .line 102
    if-eqz v3, :cond_0

    .line 103
    .line 104
    iget-object v4, v3, Lcom/appsflyer/internal/AFj1zSDK;->component3:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 105
    .line 106
    sget-object v5, Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 107
    .line 108
    if-eq v4, v5, :cond_0

    .line 109
    .line 110
    invoke-interface {p2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    iput p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->AFInAppEventType:I

    .line 121
    .line 122
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    if-eqz p2, :cond_5

    .line 131
    .line 132
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    check-cast p2, Lcom/appsflyer/internal/AFj1zSDK;

    .line 137
    .line 138
    iget-object v1, p2, Lcom/appsflyer/internal/AFj1zSDK;->component3:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 139
    .line 140
    if-nez v1, :cond_2

    .line 141
    .line 142
    const/4 v1, -0x1

    .line 143
    goto :goto_2

    .line 144
    :cond_2
    sget-object v2, Lcom/appsflyer/internal/AFf1hSDK$AFa1ySDK;->getCurrencyIso4217Code:[I

    .line 145
    .line 146
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    aget v1, v2, v1

    .line 151
    .line 152
    :goto_2
    if-eq v1, v0, :cond_4

    .line 153
    .line 154
    const/4 v2, 0x2

    .line 155
    if-eq v1, v2, :cond_3

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_3
    new-instance v1, Lcom/appsflyer/internal/r;

    .line 159
    .line 160
    invoke-direct {v1, p2, p0}, Lcom/appsflyer/internal/r;-><init>(Lcom/appsflyer/internal/AFj1zSDK;Lcom/appsflyer/internal/AFf1hSDK;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p2, v1}, Ljava/util/Observable;->addObserver(Ljava/util/Observer;)V

    .line 164
    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_4
    sget-object v2, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 168
    .line 169
    sget-object v3, Lcom/appsflyer/internal/AFg1cSDK;->component2:Lcom/appsflyer/internal/AFg1cSDK;

    .line 170
    .line 171
    new-instance v1, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .line 175
    .line 176
    iget-object v4, p2, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 177
    .line 178
    const-string v5, "source"

    .line 179
    .line 180
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string v4, " referrer collected earlier"

    .line 188
    .line 189
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    const/4 v6, 0x4

    .line 197
    const/4 v7, 0x0

    .line 198
    const/4 v5, 0x0

    .line 199
    invoke-static/range {v2 .. v7}, Lcom/appsflyer/internal/AFh1ySDK;->d$default(Lcom/appsflyer/internal/AFh1ySDK;Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 200
    .line 201
    .line 202
    invoke-direct {p0, p2}, Lcom/appsflyer/internal/AFf1hSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFj1zSDK;)V

    .line 203
    .line 204
    .line 205
    goto :goto_1

    .line 206
    :cond_5
    return-void
.end method

.method private static final AFAdRevenueData(Lcom/appsflyer/internal/AFj1zSDK;Lcom/appsflyer/internal/AFf1hSDK;Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 614
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 615
    sget-object v1, Lcom/appsflyer/internal/AFg1cSDK;->component2:Lcom/appsflyer/internal/AFg1cSDK;

    .line 616
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p0, p0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    const-string v2, "source"

    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " referrer collected via observer"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    .line 617
    invoke-static/range {v0 .. v5}, Lcom/appsflyer/internal/AFh1ySDK;->d$default(Lcom/appsflyer/internal/AFh1ySDK;Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;ZILjava/lang/Object;)V

    if-eqz p2, :cond_0

    .line 618
    check-cast p2, Lcom/appsflyer/internal/AFj1zSDK;

    invoke-direct {p1, p2}, Lcom/appsflyer/internal/AFf1hSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFj1zSDK;)V

    return-void

    :cond_0
    const-string p0, "null cannot be cast to non-null type com.appsflyer.internal.referrer.Referrer"

    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a(Lcom/appsflyer/internal/AFj1zSDK;Lcom/appsflyer/internal/AFf1hSDK;Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/appsflyer/internal/AFf1hSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFj1zSDK;Lcom/appsflyer/internal/AFf1hSDK;Ljava/util/Observable;Ljava/lang/Object;)V

    return-void
.end method

.method private final copy()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->component3:Lcom/appsflyer/internal/AFc1qSDK;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "referrers"

    .line 8
    .line 9
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    instance-of v2, v0, Ljava/util/List;

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    check-cast v0, Ljava/util/List;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    const/4 v2, 0x0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move v0, v2

    .line 30
    :goto_1
    iget v3, p0, Lcom/appsflyer/internal/AFf1hSDK;->AFInAppEventType:I

    .line 31
    .line 32
    if-ge v0, v3, :cond_2

    .line 33
    .line 34
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1hSDK;->component3:Lcom/appsflyer/internal/AFc1qSDK;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_2

    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_2
    return v2
.end method

.method private static getCurrencyIso4217Code(Lcom/appsflyer/internal/AFj1zSDK;)Z
    .locals 5

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 2
    .line 3
    const-string v0, "click_ts"

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Ljava/lang/Long;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Ljava/lang/Long;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    :goto_0
    const/4 v0, 0x0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v3

    .line 28
    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 29
    .line 30
    invoke-virtual {p0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    sub-long/2addr v3, v1

    .line 35
    const-wide/32 v1, 0x5265c00

    .line 36
    .line 37
    .line 38
    cmp-long p0, v3, v1

    .line 39
    .line 40
    if-gez p0, :cond_1

    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_1
    return v0
.end method

.method private static getMediationNetwork(Lcom/appsflyer/internal/AFb1ySDK;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/AFb1ySDK;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    if-eqz p0, :cond_1

    .line 58
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1ySDK;->AFAdRevenueData:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 59
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1ySDK;->getMediationNetwork:Ljava/lang/Boolean;

    if-eqz p0, :cond_0

    .line 60
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_1

    .line 61
    :cond_0
    const-string p0, "type"

    const-string v1, "unhashed"

    invoke-static {p0, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p0

    .line 62
    const-string v1, "value"

    invoke-static {v1, v0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    filled-new-array {p0, v0}, [Lkotlin/Pair;

    move-result-object p0

    .line 63
    invoke-static {p0}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private final getMediationNetwork(Lcom/appsflyer/internal/AFj1zSDK;)V
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/appsflyer/internal/AFf1hSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFj1zSDK;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->values:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1hSDK;->AFInAppEventParameterName:Ljava/util/concurrent/CountDownLatch;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 18
    .line 19
    sget-object v1, Lcom/appsflyer/internal/AFg1cSDK;->component2:Lcom/appsflyer/internal/AFg1cSDK;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "Added non-organic "

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const/4 v4, 0x4

    .line 36
    const/4 v5, 0x0

    .line 37
    const/4 v3, 0x0

    .line 38
    invoke-static/range {v0 .. v5}, Lcom/appsflyer/internal/AFh1ySDK;->d$default(Lcom/appsflyer/internal/AFh1ySDK;Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->AFKeystoreWrapper:I

    .line 43
    .line 44
    add-int/lit8 p1, p1, 0x1

    .line 45
    .line 46
    iput p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->AFKeystoreWrapper:I

    .line 47
    .line 48
    iget v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->AFInAppEventType:I

    .line 49
    .line 50
    if-ne p1, v0, :cond_1

    .line 51
    .line 52
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1hSDK;->AFInAppEventParameterName:Ljava/util/concurrent/CountDownLatch;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method


# virtual methods
.method public final AFAdRevenueData(Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "Lcom/appsflyer/internal/AFc1jSDK;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->valueOf:I

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    add-int/2addr p1, v0

    .line 8
    iput p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->valueOf:I

    .line 9
    .line 10
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 11
    .line 12
    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->component2:Lcom/appsflyer/internal/AFg1cSDK;

    .line 13
    .line 14
    new-instance p1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v3, "Preparing request "

    .line 17
    .line 18
    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget v3, p0, Lcom/appsflyer/internal/AFf1hSDK;->valueOf:I

    .line 22
    .line 23
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    const/4 v5, 0x4

    .line 31
    const/4 v6, 0x0

    .line 32
    const/4 v4, 0x0

    .line 33
    invoke-static/range {v1 .. v6}, Lcom/appsflyer/internal/AFh1ySDK;->d$default(Lcom/appsflyer/internal/AFh1ySDK;Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->component3:Lcom/appsflyer/internal/AFc1qSDK;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->valueOf:I

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    if-ne v1, v0, :cond_4

    .line 46
    .line 47
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->toString:Lcom/appsflyer/internal/AFd1pSDK;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    .line 50
    .line 51
    const-string v3, "appsFlyerCount"

    .line 52
    .line 53
    const/4 v4, 0x0

    .line 54
    invoke-interface {v1, v3, v4}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_0

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    move v0, v4

    .line 62
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "is_first"

    .line 67
    .line 68
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const/16 v1, 0x2d

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-string v1, "lang"

    .line 108
    .line 109
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    const-string v0, "os"

    .line 113
    .line 114
    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 115
    .line 116
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    const-string v0, "type"

    .line 120
    .line 121
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 122
    .line 123
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->toString:Lcom/appsflyer/internal/AFd1pSDK;

    .line 127
    .line 128
    iget-object v1, v0, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 129
    .line 130
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    .line 131
    .line 132
    invoke-static {v1, v0}, Lcom/appsflyer/internal/AFb1lSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFd1kSDK;Lcom/appsflyer/internal/AFd1rSDK;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    const-string v1, "request_id"

    .line 137
    .line 138
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->copydefault:Lcom/appsflyer/internal/AFd1mSDK;

    .line 142
    .line 143
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1mSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFd1uSDK;

    .line 144
    .line 145
    if-eqz v0, :cond_1

    .line 146
    .line 147
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1uSDK;->getCurrencyIso4217Code:[Ljava/lang/String;

    .line 148
    .line 149
    if-eqz v0, :cond_1

    .line 150
    .line 151
    const-string v1, "sharing_filter"

    .line 152
    .line 153
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    :cond_1
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->toString:Lcom/appsflyer/internal/AFd1pSDK;

    .line 157
    .line 158
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1pSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFd1mSDK;

    .line 159
    .line 160
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1mSDK;->component4:Lcom/appsflyer/internal/AFh1pSDK;

    .line 161
    .line 162
    if-eqz v0, :cond_2

    .line 163
    .line 164
    new-instance v1, Lcom/appsflyer/internal/AFb1ySDK;

    .line 165
    .line 166
    iget-object v3, v0, Lcom/appsflyer/internal/AFh1pSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 167
    .line 168
    iget-object v0, v0, Lcom/appsflyer/internal/AFh1pSDK;->AFAdRevenueData:Ljava/lang/Boolean;

    .line 169
    .line 170
    invoke-direct {v1, v3, v0}, Lcom/appsflyer/internal/AFb1ySDK;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 171
    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_2
    move-object v1, v2

    .line 175
    :goto_1
    invoke-static {v1}, Lcom/appsflyer/internal/AFf1hSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFb1ySDK;)Ljava/util/Map;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    if-eqz v0, :cond_3

    .line 180
    .line 181
    const-string v1, "gaid"

    .line 182
    .line 183
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    :cond_3
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->toString:Lcom/appsflyer/internal/AFd1pSDK;

    .line 187
    .line 188
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 189
    .line 190
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 191
    .line 192
    invoke-static {v0}, Lcom/appsflyer/internal/AFb1rSDK;->getRevenue(Landroid/content/Context;)Lcom/appsflyer/internal/AFb1ySDK;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-static {v0}, Lcom/appsflyer/internal/AFf1hSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFb1ySDK;)Ljava/util/Map;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    if-eqz v0, :cond_4

    .line 201
    .line 202
    const-string v1, "oaid"

    .line 203
    .line 204
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 208
    .line 209
    .line 210
    move-result-wide v0

    .line 211
    new-instance v3, Ljava/text/SimpleDateFormat;

    .line 212
    .line 213
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 214
    .line 215
    const-string v5, "yyyy-MM-dd\'T\'HH:mm:ss.SSS"

    .line 216
    .line 217
    invoke-direct {v3, v5, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 218
    .line 219
    .line 220
    const-string v4, "UTC"

    .line 221
    .line 222
    invoke-static {v4}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 223
    .line 224
    .line 225
    move-result-object v4

    .line 226
    invoke-virtual {v3, v4}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 227
    .line 228
    .line 229
    new-instance v4, Ljava/util/Date;

    .line 230
    .line 231
    invoke-direct {v4, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v3, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    const-string v1, "timestamp"

    .line 239
    .line 240
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    iget v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->valueOf:I

    .line 244
    .line 245
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    const-string v3, "request_count"

    .line 250
    .line 251
    invoke-interface {p1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->values:Ljava/util/List;

    .line 255
    .line 256
    check-cast v0, Ljava/lang/Iterable;

    .line 257
    .line 258
    new-instance v3, Ljava/util/ArrayList;

    .line 259
    .line 260
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 261
    .line 262
    .line 263
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    :cond_5
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 268
    .line 269
    .line 270
    move-result v4

    .line 271
    const-string v5, "null cannot be cast to non-null type kotlin.String"

    .line 272
    .line 273
    if-eqz v4, :cond_9

    .line 274
    .line 275
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    check-cast v4, Lcom/appsflyer/internal/AFj1zSDK;

    .line 280
    .line 281
    iget-object v6, v4, Lcom/appsflyer/internal/AFj1zSDK;->component3:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 282
    .line 283
    sget-object v7, Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 284
    .line 285
    if-ne v6, v7, :cond_8

    .line 286
    .line 287
    iget-object v6, v4, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 288
    .line 289
    const-string v7, "referrer"

    .line 290
    .line 291
    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object v6

    .line 295
    instance-of v7, v6, Ljava/lang/String;

    .line 296
    .line 297
    if-eqz v7, :cond_6

    .line 298
    .line 299
    check-cast v6, Ljava/lang/String;

    .line 300
    .line 301
    goto :goto_3

    .line 302
    :cond_6
    move-object v6, v2

    .line 303
    :goto_3
    if-eqz v6, :cond_8

    .line 304
    .line 305
    iget-object v4, v4, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 306
    .line 307
    const-string v7, "source"

    .line 308
    .line 309
    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    move-result-object v4

    .line 313
    if-eqz v4, :cond_7

    .line 314
    .line 315
    check-cast v4, Ljava/lang/String;

    .line 316
    .line 317
    invoke-static {v7, v4}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 318
    .line 319
    .line 320
    move-result-object v4

    .line 321
    const-string v5, "value"

    .line 322
    .line 323
    invoke-static {v5, v6}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 324
    .line 325
    .line 326
    move-result-object v5

    .line 327
    filled-new-array {v4, v5}, [Lkotlin/Pair;

    .line 328
    .line 329
    .line 330
    move-result-object v4

    .line 331
    invoke-static {v4}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 332
    .line 333
    .line 334
    move-result-object v4

    .line 335
    goto :goto_4

    .line 336
    :cond_7
    invoke-static {v5}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    return-object v2

    .line 340
    :cond_8
    move-object v4, v2

    .line 341
    :goto_4
    if-eqz v4, :cond_5

    .line 342
    .line 343
    invoke-interface {v3, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 344
    .line 345
    .line 346
    goto :goto_2

    .line 347
    :cond_9
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 348
    .line 349
    .line 350
    move-result v0

    .line 351
    if-nez v0, :cond_a

    .line 352
    .line 353
    const-string v0, "referrers"

    .line 354
    .line 355
    invoke-interface {p1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    .line 357
    .line 358
    :cond_a
    iget-object p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->component3:Lcom/appsflyer/internal/AFc1qSDK;

    .line 359
    .line 360
    new-instance v0, Lcom/appsflyer/internal/AFj1mSDK;

    .line 361
    .line 362
    iget-object v3, p0, Lcom/appsflyer/internal/AFf1hSDK;->toString:Lcom/appsflyer/internal/AFd1pSDK;

    .line 363
    .line 364
    const/4 v4, 0x2

    .line 365
    invoke-direct {v0, v3, v2, v4, v2}, Lcom/appsflyer/internal/AFj1mSDK;-><init>(Lcom/appsflyer/internal/AFd1pSDK;Lcom/appsflyer/internal/AFj1lSDK;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 366
    .line 367
    .line 368
    iget-object v3, p0, Lcom/appsflyer/internal/AFf1oSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 369
    .line 370
    iget-object v3, v3, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 371
    .line 372
    iget-object v6, p0, Lcom/appsflyer/internal/AFf1hSDK;->component3:Lcom/appsflyer/internal/AFc1qSDK;

    .line 373
    .line 374
    invoke-virtual {v6}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 375
    .line 376
    .line 377
    move-result-object v6

    .line 378
    invoke-interface {v6, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    move-result-object v1

    .line 382
    if-eqz v1, :cond_12

    .line 383
    .line 384
    check-cast v1, Ljava/lang/String;

    .line 385
    .line 386
    iget-object v2, v0, Lcom/appsflyer/internal/AFj1mSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 387
    .line 388
    iget-object v2, v2, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 389
    .line 390
    iget-object v2, v2, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 391
    .line 392
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v2

    .line 396
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 397
    .line 398
    .line 399
    iget-object v5, v0, Lcom/appsflyer/internal/AFj1mSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 400
    .line 401
    invoke-virtual {v5}, Lcom/appsflyer/internal/AFd1pSDK;->component4()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v5

    .line 405
    if-eqz v5, :cond_c

    .line 406
    .line 407
    invoke-static {v5}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 408
    .line 409
    .line 410
    move-result v6

    .line 411
    if-eqz v6, :cond_b

    .line 412
    .line 413
    goto :goto_5

    .line 414
    :cond_b
    invoke-static {v5}, Lkotlin/text/StringsKt;->Z0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 415
    .line 416
    .line 417
    move-result-object v5

    .line 418
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object v5

    .line 422
    const-string v6, "-"

    .line 423
    .line 424
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v5

    .line 428
    invoke-virtual {v6, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 429
    .line 430
    .line 431
    move-result-object v5

    .line 432
    :cond_c
    :goto_5
    if-nez v5, :cond_d

    .line 433
    .line 434
    const-string v5, ""

    .line 435
    .line 436
    :cond_d
    invoke-static {v5}, Lkotlin/text/StringsKt;->Z0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 437
    .line 438
    .line 439
    move-result-object v5

    .line 440
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object v5

    .line 444
    iget-object v0, v0, Lcom/appsflyer/internal/AFj1mSDK;->getRevenue:Lcom/appsflyer/internal/AFj1lSDK;

    .line 445
    .line 446
    const-string v6, "https://%sdlsdk.%s/v1.0/android/"

    .line 447
    .line 448
    invoke-interface {v0, v6}, Lcom/appsflyer/internal/AFj1lSDK;->AFAdRevenueData(Ljava/lang/String;)Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object v0

    .line 452
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 453
    .line 454
    .line 455
    move-result-object v0

    .line 456
    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 457
    .line 458
    .line 459
    move-result-object v0

    .line 460
    new-instance v6, Ljava/lang/StringBuilder;

    .line 461
    .line 462
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 463
    .line 464
    .line 465
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 466
    .line 467
    .line 468
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    invoke-virtual {v0, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 476
    .line 477
    .line 478
    move-result-object v0

    .line 479
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 480
    .line 481
    .line 482
    invoke-static {v0, v3, v1}, Lcom/appsflyer/internal/AFj1mSDK;->L_(Landroid/net/Uri$Builder;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 483
    .line 484
    .line 485
    move-result-object v0

    .line 486
    const-string v1, "sdk_version"

    .line 487
    .line 488
    sget-object v2, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue:Ljava/lang/String;

    .line 489
    .line 490
    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 491
    .line 492
    .line 493
    move-result-object v0

    .line 494
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 499
    .line 500
    .line 501
    move-result-object v0

    .line 502
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 503
    .line 504
    .line 505
    invoke-virtual {p1, v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 506
    .line 507
    .line 508
    iget-object p1, p0, Lcom/appsflyer/internal/AFf1hSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 509
    .line 510
    iget v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->valueOf:I

    .line 511
    .line 512
    if-lez v0, :cond_10

    .line 513
    .line 514
    if-le v0, v4, :cond_e

    .line 515
    .line 516
    goto :goto_6

    .line 517
    :cond_e
    add-int/lit8 v0, v0, -0x1

    .line 518
    .line 519
    iget-object v1, p1, Lcom/appsflyer/internal/AFh1qSDK;->component4:[J

    .line 520
    .line 521
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 522
    .line 523
    .line 524
    move-result-wide v2

    .line 525
    aput-wide v2, v1, v0

    .line 526
    .line 527
    if-nez v0, :cond_11

    .line 528
    .line 529
    iget-wide v1, p1, Lcom/appsflyer/internal/AFh1qSDK;->component1:J

    .line 530
    .line 531
    const-wide/16 v3, 0x0

    .line 532
    .line 533
    cmp-long v3, v1, v3

    .line 534
    .line 535
    if-eqz v3, :cond_f

    .line 536
    .line 537
    iget-object v3, p1, Lcom/appsflyer/internal/AFh1qSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 538
    .line 539
    iget-object v4, p1, Lcom/appsflyer/internal/AFh1qSDK;->component4:[J

    .line 540
    .line 541
    aget-wide v5, v4, v0

    .line 542
    .line 543
    sub-long/2addr v5, v1

    .line 544
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 545
    .line 546
    .line 547
    move-result-object v0

    .line 548
    const-string v1, "from_fg"

    .line 549
    .line 550
    invoke-interface {v3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 551
    .line 552
    .line 553
    iget-object v0, p1, Lcom/appsflyer/internal/AFh1qSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 554
    .line 555
    new-instance v1, Lorg/json/JSONObject;

    .line 556
    .line 557
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 558
    .line 559
    .line 560
    iget-object p1, p1, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1rSDK;

    .line 561
    .line 562
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 563
    .line 564
    .line 565
    move-result-object v0

    .line 566
    const-string v1, "ddl"

    .line 567
    .line 568
    invoke-interface {p1, v1, v0}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 569
    .line 570
    .line 571
    goto :goto_7

    .line 572
    :cond_f
    const-string p1, "Metrics: fg ts is missing"

    .line 573
    .line 574
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 575
    .line 576
    .line 577
    goto :goto_7

    .line 578
    :cond_10
    :goto_6
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 579
    .line 580
    const-string v1, "Metrics: Unexpected ddl requestCount = "

    .line 581
    .line 582
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 583
    .line 584
    .line 585
    move-result-object v0

    .line 586
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object v0

    .line 590
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 591
    .line 592
    .line 593
    const-string v0, "Unexpected ddl requestCount - start"

    .line 594
    .line 595
    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 596
    .line 597
    .line 598
    :cond_11
    :goto_7
    iget-object p1, p0, Lcom/appsflyer/internal/AFf1oSDK;->component4:Lcom/appsflyer/internal/AFe1sSDK;

    .line 599
    .line 600
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1hSDK;->component3:Lcom/appsflyer/internal/AFc1qSDK;

    .line 601
    .line 602
    invoke-virtual {p1, p0}, Lcom/appsflyer/internal/AFe1sSDK;->getMonetizationNetwork(Lcom/appsflyer/internal/AFc1qSDK;)Lcom/appsflyer/internal/AFe1rSDK;

    .line 603
    .line 604
    .line 605
    move-result-object p0

    .line 606
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 607
    .line 608
    .line 609
    return-object p0

    .line 610
    :cond_12
    invoke-static {v5}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 611
    .line 612
    .line 613
    return-object v2
.end method

.method public final AFAdRevenueData()Z
    .locals 0

    .line 619
    const/4 p0, 0x0

    return p0
.end method

.method public final a_()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final bridge synthetic component1()Lcom/appsflyer/attribution/AppsFlyerRequestListener;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final equals()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final getMonetizationNetwork()Lcom/appsflyer/internal/AFe1dSDK;
    .locals 15
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v1, Lcom/appsflyer/internal/AFe1dSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1dSDK;

    .line 2
    .line 3
    const/4 v2, 0x1

    .line 4
    const/4 v3, 0x0

    .line 5
    :try_start_0
    invoke-super {p0}, Lcom/appsflyer/internal/AFf1oSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFe1dSDK;

    .line 6
    .line 7
    .line 8
    move-result-object v4

    .line 9
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 10
    .line 11
    .line 12
    :try_start_1
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 13
    .line 14
    iget v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->valueOf:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 15
    .line 16
    const-string v5, "ddl"

    .line 17
    .line 18
    const-wide/16 v6, 0x0

    .line 19
    .line 20
    const/4 v8, 0x2

    .line 21
    if-lez v1, :cond_2

    .line 22
    .line 23
    if-le v1, v8, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sub-int/2addr v1, v2

    .line 27
    :try_start_2
    iget-object v9, v0, Lcom/appsflyer/internal/AFh1qSDK;->areAllFieldsValid:[J

    .line 28
    .line 29
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 30
    .line 31
    .line 32
    move-result-wide v10

    .line 33
    aput-wide v10, v9, v1

    .line 34
    .line 35
    iget-object v9, v0, Lcom/appsflyer/internal/AFh1qSDK;->component4:[J

    .line 36
    .line 37
    aget-wide v10, v9, v1

    .line 38
    .line 39
    cmp-long v9, v10, v6

    .line 40
    .line 41
    if-eqz v9, :cond_1

    .line 42
    .line 43
    iget-object v9, v0, Lcom/appsflyer/internal/AFh1qSDK;->component3:[J

    .line 44
    .line 45
    iget-object v12, v0, Lcom/appsflyer/internal/AFh1qSDK;->areAllFieldsValid:[J

    .line 46
    .line 47
    aget-wide v13, v12, v1

    .line 48
    .line 49
    sub-long/2addr v13, v10

    .line 50
    aput-wide v13, v9, v1

    .line 51
    .line 52
    iget-object v1, v0, Lcom/appsflyer/internal/AFh1qSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 53
    .line 54
    const-string v10, "net"

    .line 55
    .line 56
    invoke-interface {v1, v10, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    iget-object v1, v0, Lcom/appsflyer/internal/AFh1qSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 60
    .line 61
    new-instance v9, Lorg/json/JSONObject;

    .line 62
    .line 63
    invoke-direct {v9, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, v0, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1rSDK;

    .line 67
    .line 68
    invoke-virtual {v9}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-interface {v0, v5, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :catch_0
    move-exception v0

    .line 77
    move-object v1, v4

    .line 78
    goto/16 :goto_4

    .line 79
    .line 80
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    const-string v9, "Metrics: ddlStart["

    .line 83
    .line 84
    invoke-direct {v0, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v1, "] ts is missing"

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_2
    :goto_0
    const-string v0, "Unexpected ddl requestCount - end"

    .line 104
    .line 105
    new-instance v9, Ljava/lang/IllegalStateException;

    .line 106
    .line 107
    const-string v10, "Metrics: Unexpected ddl requestCount = "

    .line 108
    .line 109
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v10, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-direct {v9, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v0, v9}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 121
    .line 122
    .line 123
    :goto_1
    sget-object v0, Lcom/appsflyer/internal/AFf1hSDK$AFa1ySDK;->getMonetizationNetwork:[I

    .line 124
    .line 125
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    aget v0, v0, v1

    .line 130
    .line 131
    if-eq v0, v2, :cond_5

    .line 132
    .line 133
    if-eq v0, v8, :cond_3

    .line 134
    .line 135
    return-object v4

    .line 136
    :cond_3
    sget-object v9, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 137
    .line 138
    sget-object v10, Lcom/appsflyer/internal/AFg1cSDK;->component2:Lcom/appsflyer/internal/AFg1cSDK;

    .line 139
    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    const-string v1, "Error occurred. Server response code = "

    .line 143
    .line 144
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1oSDK;->component1:Lcom/appsflyer/internal/AFe1kSDK;

    .line 148
    .line 149
    if-eqz v1, :cond_4

    .line 150
    .line 151
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFe1kSDK;->getStatusCode()I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    goto :goto_2

    .line 160
    :cond_4
    move-object v1, v3

    .line 161
    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v11

    .line 168
    const/4 v13, 0x4

    .line 169
    const/4 v14, 0x0

    .line 170
    const/4 v12, 0x0

    .line 171
    invoke-static/range {v9 .. v14}, Lcom/appsflyer/internal/AFh1ySDK;->d$default(Lcom/appsflyer/internal/AFh1ySDK;Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    new-instance v0, Lcom/appsflyer/deeplink/DeepLinkResult;

    .line 175
    .line 176
    sget-object v1, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->HTTP_STATUS_CODE:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    .line 177
    .line 178
    invoke-direct {v0, v3, v1}, Lcom/appsflyer/deeplink/DeepLinkResult;-><init>(Lcom/appsflyer/deeplink/DeepLink;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 179
    .line 180
    .line 181
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 182
    .line 183
    iget-object v5, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 184
    .line 185
    iget-wide v5, v5, Lcom/appsflyer/internal/AFc1sSDK;->component3:J

    .line 186
    .line 187
    invoke-virtual {v1, v0, v5, v6}, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork(Lcom/appsflyer/deeplink/DeepLinkResult;J)V

    .line 188
    .line 189
    .line 190
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 191
    .line 192
    invoke-virtual {v1, v0}, Lcom/appsflyer/internal/AFc1sSDK;->getRevenue(Lcom/appsflyer/deeplink/DeepLinkResult;)V

    .line 193
    .line 194
    .line 195
    return-object v4

    .line 196
    :cond_5
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1oSDK;->component1:Lcom/appsflyer/internal/AFe1kSDK;

    .line 197
    .line 198
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFe1kSDK;->getBody()Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 206
    .line 207
    .line 208
    check-cast v0, Lcom/appsflyer/internal/AFc1jSDK;

    .line 209
    .line 210
    iget-object v1, v0, Lcom/appsflyer/internal/AFc1jSDK;->AFAdRevenueData:Lcom/appsflyer/deeplink/DeepLink;

    .line 211
    .line 212
    if-eqz v1, :cond_6

    .line 213
    .line 214
    new-instance v0, Lcom/appsflyer/deeplink/DeepLinkResult;

    .line 215
    .line 216
    invoke-direct {v0, v1, v3}, Lcom/appsflyer/deeplink/DeepLinkResult;-><init>(Lcom/appsflyer/deeplink/DeepLink;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 217
    .line 218
    .line 219
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 220
    .line 221
    iget-object v5, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 222
    .line 223
    iget-wide v5, v5, Lcom/appsflyer/internal/AFc1sSDK;->component3:J

    .line 224
    .line 225
    invoke-virtual {v1, v0, v5, v6}, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork(Lcom/appsflyer/deeplink/DeepLinkResult;J)V

    .line 226
    .line 227
    .line 228
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 229
    .line 230
    invoke-virtual {v1, v0}, Lcom/appsflyer/internal/AFc1sSDK;->getRevenue(Lcom/appsflyer/deeplink/DeepLinkResult;)V

    .line 231
    .line 232
    .line 233
    return-object v4

    .line 234
    :cond_6
    iget v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->valueOf:I

    .line 235
    .line 236
    if-gt v1, v2, :cond_9

    .line 237
    .line 238
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFc1jSDK;->getMonetizationNetwork()Z

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    if-eqz v0, :cond_9

    .line 243
    .line 244
    invoke-direct {p0}, Lcom/appsflyer/internal/AFf1hSDK;->copy()Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-eqz v0, :cond_9

    .line 249
    .line 250
    sget-object v8, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 251
    .line 252
    sget-object v9, Lcom/appsflyer/internal/AFg1cSDK;->component2:Lcom/appsflyer/internal/AFg1cSDK;

    .line 253
    .line 254
    const-string v10, "Waiting for referrers..."

    .line 255
    .line 256
    const/4 v12, 0x4

    .line 257
    const/4 v13, 0x0

    .line 258
    const/4 v11, 0x0

    .line 259
    invoke-static/range {v8 .. v13}, Lcom/appsflyer/internal/AFh1ySDK;->d$default(Lcom/appsflyer/internal/AFh1ySDK;Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 260
    .line 261
    .line 262
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->AFInAppEventParameterName:Ljava/util/concurrent/CountDownLatch;

    .line 263
    .line 264
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 265
    .line 266
    .line 267
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 268
    .line 269
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 270
    .line 271
    .line 272
    move-result-wide v8

    .line 273
    iget-object v1, v0, Lcom/appsflyer/internal/AFh1qSDK;->areAllFieldsValid:[J

    .line 274
    .line 275
    const/4 v10, 0x0

    .line 276
    aget-wide v10, v1, v10

    .line 277
    .line 278
    cmp-long v1, v10, v6

    .line 279
    .line 280
    if-eqz v1, :cond_7

    .line 281
    .line 282
    iget-object v1, v0, Lcom/appsflyer/internal/AFh1qSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 283
    .line 284
    const-string v6, "rfr_wait"

    .line 285
    .line 286
    sub-long/2addr v8, v10

    .line 287
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 288
    .line 289
    .line 290
    move-result-object v7

    .line 291
    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    iget-object v1, v0, Lcom/appsflyer/internal/AFh1qSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 295
    .line 296
    new-instance v6, Lorg/json/JSONObject;

    .line 297
    .line 298
    invoke-direct {v6, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 299
    .line 300
    .line 301
    iget-object v0, v0, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1rSDK;

    .line 302
    .line 303
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    invoke-interface {v0, v5, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    goto :goto_3

    .line 311
    :cond_7
    const-string v0, "Metrics: ddlEnd[0] ts is missing"

    .line 312
    .line 313
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    :goto_3
    iget v0, p0, Lcom/appsflyer/internal/AFf1hSDK;->AFKeystoreWrapper:I

    .line 317
    .line 318
    iget v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->AFInAppEventType:I

    .line 319
    .line 320
    if-ne v0, v1, :cond_8

    .line 321
    .line 322
    new-instance v0, Lcom/appsflyer/deeplink/DeepLinkResult;

    .line 323
    .line 324
    invoke-direct {v0, v3, v3}, Lcom/appsflyer/deeplink/DeepLinkResult;-><init>(Lcom/appsflyer/deeplink/DeepLink;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 325
    .line 326
    .line 327
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 328
    .line 329
    iget-object v5, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 330
    .line 331
    iget-wide v5, v5, Lcom/appsflyer/internal/AFc1sSDK;->component3:J

    .line 332
    .line 333
    invoke-virtual {v1, v0, v5, v6}, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork(Lcom/appsflyer/deeplink/DeepLinkResult;J)V

    .line 334
    .line 335
    .line 336
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 337
    .line 338
    invoke-virtual {v1, v0}, Lcom/appsflyer/internal/AFc1sSDK;->getRevenue(Lcom/appsflyer/deeplink/DeepLinkResult;)V

    .line 339
    .line 340
    .line 341
    sget-object p0, Lcom/appsflyer/internal/AFe1dSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 342
    .line 343
    return-object p0

    .line 344
    :cond_8
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFf1oSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFe1dSDK;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    return-object p0

    .line 349
    :cond_9
    new-instance v0, Lcom/appsflyer/deeplink/DeepLinkResult;

    .line 350
    .line 351
    invoke-direct {v0, v3, v3}, Lcom/appsflyer/deeplink/DeepLinkResult;-><init>(Lcom/appsflyer/deeplink/DeepLink;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 352
    .line 353
    .line 354
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 355
    .line 356
    iget-object v5, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 357
    .line 358
    iget-wide v5, v5, Lcom/appsflyer/internal/AFc1sSDK;->component3:J

    .line 359
    .line 360
    invoke-virtual {v1, v0, v5, v6}, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork(Lcom/appsflyer/deeplink/DeepLinkResult;J)V

    .line 361
    .line 362
    .line 363
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 364
    .line 365
    invoke-virtual {v1, v0}, Lcom/appsflyer/internal/AFc1sSDK;->getRevenue(Lcom/appsflyer/deeplink/DeepLinkResult;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 366
    .line 367
    .line 368
    return-object v4

    .line 369
    :catch_1
    move-exception v0

    .line 370
    :goto_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 371
    .line 372
    .line 373
    move-result-object v4

    .line 374
    instance-of v5, v4, Ljava/lang/InterruptedException;

    .line 375
    .line 376
    if-eqz v5, :cond_a

    .line 377
    .line 378
    goto :goto_5

    .line 379
    :cond_a
    instance-of v2, v4, Ljava/io/InterruptedIOException;

    .line 380
    .line 381
    :goto_5
    if-eqz v2, :cond_b

    .line 382
    .line 383
    new-instance v0, Ljava/util/concurrent/TimeoutException;

    .line 384
    .line 385
    invoke-direct {v0}, Ljava/util/concurrent/TimeoutException;-><init>()V

    .line 386
    .line 387
    .line 388
    const-string v1, "[DDL] Timeout"

    .line 389
    .line 390
    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 391
    .line 392
    .line 393
    sget-object v4, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 394
    .line 395
    sget-object v5, Lcom/appsflyer/internal/AFg1cSDK;->component2:Lcom/appsflyer/internal/AFg1cSDK;

    .line 396
    .line 397
    new-instance v0, Ljava/lang/StringBuilder;

    .line 398
    .line 399
    const-string v1, "Timeout, didn\'t manage to find deferred deeplink after "

    .line 400
    .line 401
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    iget v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->valueOf:I

    .line 405
    .line 406
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    const-string v1, " attempt(s) within "

    .line 410
    .line 411
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 415
    .line 416
    iget-wide v1, v1, Lcom/appsflyer/internal/AFc1sSDK;->component3:J

    .line 417
    .line 418
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 419
    .line 420
    .line 421
    const-string v1, " milliseconds"

    .line 422
    .line 423
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 424
    .line 425
    .line 426
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object v6

    .line 430
    const/4 v8, 0x4

    .line 431
    const/4 v9, 0x0

    .line 432
    const/4 v7, 0x0

    .line 433
    invoke-static/range {v4 .. v9}, Lcom/appsflyer/internal/AFh1ySDK;->d$default(Lcom/appsflyer/internal/AFh1ySDK;Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 434
    .line 435
    .line 436
    new-instance v0, Lcom/appsflyer/deeplink/DeepLinkResult;

    .line 437
    .line 438
    sget-object v1, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->TIMEOUT:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    .line 439
    .line 440
    invoke-direct {v0, v3, v1}, Lcom/appsflyer/deeplink/DeepLinkResult;-><init>(Lcom/appsflyer/deeplink/DeepLink;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 441
    .line 442
    .line 443
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1hSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 444
    .line 445
    iget-object v2, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 446
    .line 447
    iget-wide v2, v2, Lcom/appsflyer/internal/AFc1sSDK;->component3:J

    .line 448
    .line 449
    invoke-virtual {v1, v0, v2, v3}, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork(Lcom/appsflyer/deeplink/DeepLinkResult;J)V

    .line 450
    .line 451
    .line 452
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 453
    .line 454
    invoke-virtual {p0, v0}, Lcom/appsflyer/internal/AFc1sSDK;->getRevenue(Lcom/appsflyer/deeplink/DeepLinkResult;)V

    .line 455
    .line 456
    .line 457
    sget-object v1, Lcom/appsflyer/internal/AFe1dSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFe1dSDK;

    .line 458
    .line 459
    goto :goto_6

    .line 460
    :cond_b
    instance-of v2, v4, Ljava/io/IOException;

    .line 461
    .line 462
    if-eqz v2, :cond_c

    .line 463
    .line 464
    sget-object v4, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 465
    .line 466
    sget-object v5, Lcom/appsflyer/internal/AFg1cSDK;->component2:Lcom/appsflyer/internal/AFg1cSDK;

    .line 467
    .line 468
    const/4 v8, 0x4

    .line 469
    const/4 v9, 0x0

    .line 470
    const-string v6, "Http Exception: the request was not sent to the server"

    .line 471
    .line 472
    const/4 v7, 0x0

    .line 473
    invoke-static/range {v4 .. v9}, Lcom/appsflyer/internal/AFh1ySDK;->d$default(Lcom/appsflyer/internal/AFh1ySDK;Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 474
    .line 475
    .line 476
    new-instance v0, Lcom/appsflyer/deeplink/DeepLinkResult;

    .line 477
    .line 478
    sget-object v2, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->NETWORK:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    .line 479
    .line 480
    invoke-direct {v0, v3, v2}, Lcom/appsflyer/deeplink/DeepLinkResult;-><init>(Lcom/appsflyer/deeplink/DeepLink;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 481
    .line 482
    .line 483
    iget-object v2, p0, Lcom/appsflyer/internal/AFf1hSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 484
    .line 485
    iget-object v3, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 486
    .line 487
    iget-wide v3, v3, Lcom/appsflyer/internal/AFc1sSDK;->component3:J

    .line 488
    .line 489
    invoke-virtual {v2, v0, v3, v4}, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork(Lcom/appsflyer/deeplink/DeepLinkResult;J)V

    .line 490
    .line 491
    .line 492
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 493
    .line 494
    invoke-virtual {p0, v0}, Lcom/appsflyer/internal/AFc1sSDK;->getRevenue(Lcom/appsflyer/deeplink/DeepLinkResult;)V

    .line 495
    .line 496
    .line 497
    goto :goto_6

    .line 498
    :cond_c
    sget-object v4, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 499
    .line 500
    sget-object v5, Lcom/appsflyer/internal/AFg1cSDK;->component2:Lcom/appsflyer/internal/AFg1cSDK;

    .line 501
    .line 502
    const-string v2, "Unexpected Exception: "

    .line 503
    .line 504
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 505
    .line 506
    .line 507
    move-result-object v0

    .line 508
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object v6

    .line 512
    const/4 v8, 0x4

    .line 513
    const/4 v9, 0x0

    .line 514
    const/4 v7, 0x0

    .line 515
    invoke-static/range {v4 .. v9}, Lcom/appsflyer/internal/AFh1ySDK;->d$default(Lcom/appsflyer/internal/AFh1ySDK;Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 516
    .line 517
    .line 518
    new-instance v0, Lcom/appsflyer/deeplink/DeepLinkResult;

    .line 519
    .line 520
    sget-object v2, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->UNEXPECTED:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    .line 521
    .line 522
    invoke-direct {v0, v3, v2}, Lcom/appsflyer/deeplink/DeepLinkResult;-><init>(Lcom/appsflyer/deeplink/DeepLink;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 523
    .line 524
    .line 525
    iget-object v2, p0, Lcom/appsflyer/internal/AFf1hSDK;->hashCode:Lcom/appsflyer/internal/AFh1qSDK;

    .line 526
    .line 527
    iget-object v3, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 528
    .line 529
    iget-wide v3, v3, Lcom/appsflyer/internal/AFc1sSDK;->component3:J

    .line 530
    .line 531
    invoke-virtual {v2, v0, v3, v4}, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork(Lcom/appsflyer/deeplink/DeepLinkResult;J)V

    .line 532
    .line 533
    .line 534
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 535
    .line 536
    invoke-virtual {p0, v0}, Lcom/appsflyer/internal/AFc1sSDK;->getRevenue(Lcom/appsflyer/deeplink/DeepLinkResult;)V

    .line 537
    .line 538
    .line 539
    :goto_6
    return-object v1
.end method

.method public final getRevenue()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1hSDK;->copy:Lcom/appsflyer/internal/AFc1sSDK;

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/appsflyer/internal/AFc1sSDK;->component3:J

    .line 4
    .line 5
    return-wide v0
.end method
