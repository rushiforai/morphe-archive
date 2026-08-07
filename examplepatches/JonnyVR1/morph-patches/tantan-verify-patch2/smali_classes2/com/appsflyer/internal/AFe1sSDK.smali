.class public final Lcom/appsflyer/internal/AFe1sSDK;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static $10:I = 0x0

.field private static $11:I = 0x1

.field public static AFAdRevenueData:Ljava/lang/String; = null

.field private static areAllFieldsValid:I = 0x0

.field private static component1:I = 0x0

.field private static component2:I = 0x1

.field private static getMonetizationNetwork:Ljava/lang/String;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# instance fields
.field private final component4:Lcom/appsflyer/internal/AFe1fSDK;

.field private final getCurrencyIso4217Code:Lcom/appsflyer/AppsFlyerProperties;

.field private final getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

.field private final getRevenue:Lcom/appsflyer/internal/AFe1tSDK;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/appsflyer/internal/AFe1sSDK;->getMonetizationNetwork()V

    .line 2
    .line 3
    .line 4
    const-string v0, "https://%sgcdsdk.%s/install_data/v5.0/"

    .line 5
    .line 6
    sput-object v0, Lcom/appsflyer/internal/AFe1sSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "https://%sonelink.%s/shortlink-sdk/v2"

    .line 9
    .line 10
    sput-object v0, Lcom/appsflyer/internal/AFe1sSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 11
    .line 12
    sget v0, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    .line 13
    .line 14
    add-int/lit8 v0, v0, 0x15

    .line 15
    .line 16
    rem-int/lit16 v1, v0, 0x80

    .line 17
    .line 18
    sput v1, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    .line 19
    .line 20
    rem-int/lit8 v0, v0, 0x2

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    const/16 v0, 0x5e

    .line 25
    .line 26
    div-int/lit8 v0, v0, 0x0

    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public constructor <init>(Lcom/appsflyer/internal/AFe1tSDK;Lcom/appsflyer/internal/AFd1pSDK;Lcom/appsflyer/AppsFlyerProperties;Lcom/appsflyer/internal/AFe1fSDK;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue:Lcom/appsflyer/internal/AFe1tSDK;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/appsflyer/internal/AFe1sSDK;->getCurrencyIso4217Code:Lcom/appsflyer/AppsFlyerProperties;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/appsflyer/internal/AFe1sSDK;->component4:Lcom/appsflyer/internal/AFe1fSDK;

    .line 11
    .line 12
    return-void
.end method

.method private static a(ILjava/lang/String;IZI[Ljava/lang/Object;)V
    .locals 9

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    :cond_0
    check-cast p1, [C

    .line 8
    .line 9
    new-instance v0, Lcom/appsflyer/internal/AFk1ySDK;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/appsflyer/internal/AFk1ySDK;-><init>()V

    .line 12
    .line 13
    .line 14
    new-array v1, p0, [C

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    iput v2, v0, Lcom/appsflyer/internal/AFk1ySDK;->AFAdRevenueData:I

    .line 18
    .line 19
    :goto_0
    iget v3, v0, Lcom/appsflyer/internal/AFk1ySDK;->AFAdRevenueData:I

    .line 20
    .line 21
    if-ge v3, p0, :cond_1

    .line 22
    .line 23
    sget v4, Lcom/appsflyer/internal/AFe1sSDK;->$10:I

    .line 24
    .line 25
    add-int/lit8 v4, v4, 0x5d

    .line 26
    .line 27
    rem-int/lit16 v4, v4, 0x80

    .line 28
    .line 29
    sput v4, Lcom/appsflyer/internal/AFe1sSDK;->$11:I

    .line 30
    .line 31
    aget-char v4, p1, v3

    .line 32
    .line 33
    iput v4, v0, Lcom/appsflyer/internal/AFk1ySDK;->getRevenue:I

    .line 34
    .line 35
    add-int/2addr v4, p4

    .line 36
    int-to-char v4, v4

    .line 37
    aput-char v4, v1, v3

    .line 38
    .line 39
    sget v5, Lcom/appsflyer/internal/AFe1sSDK;->component1:I

    .line 40
    .line 41
    int-to-long v5, v5

    .line 42
    const-wide v7, -0x12c4a9074a95d702L

    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    xor-long/2addr v5, v7

    .line 48
    long-to-int v5, v5

    .line 49
    sub-int/2addr v4, v5

    .line 50
    int-to-char v4, v4

    .line 51
    aput-char v4, v1, v3

    .line 52
    .line 53
    add-int/lit8 v3, v3, 0x1

    .line 54
    .line 55
    iput v3, v0, Lcom/appsflyer/internal/AFk1ySDK;->AFAdRevenueData:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    if-lez p2, :cond_2

    .line 59
    .line 60
    sget p1, Lcom/appsflyer/internal/AFe1sSDK;->$10:I

    .line 61
    .line 62
    add-int/lit8 p1, p1, 0x7

    .line 63
    .line 64
    rem-int/lit16 p1, p1, 0x80

    .line 65
    .line 66
    sput p1, Lcom/appsflyer/internal/AFe1sSDK;->$11:I

    .line 67
    .line 68
    iput p2, v0, Lcom/appsflyer/internal/AFk1ySDK;->getMediationNetwork:I

    .line 69
    .line 70
    new-array p1, p0, [C

    .line 71
    .line 72
    invoke-static {v1, v2, p1, v2, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 73
    .line 74
    .line 75
    iget p2, v0, Lcom/appsflyer/internal/AFk1ySDK;->getMediationNetwork:I

    .line 76
    .line 77
    sub-int p4, p0, p2

    .line 78
    .line 79
    invoke-static {p1, v2, v1, p4, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    .line 81
    .line 82
    iget p2, v0, Lcom/appsflyer/internal/AFk1ySDK;->getMediationNetwork:I

    .line 83
    .line 84
    sub-int p4, p0, p2

    .line 85
    .line 86
    invoke-static {p1, p2, v1, v2, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 87
    .line 88
    .line 89
    :cond_2
    if-eqz p3, :cond_4

    .line 90
    .line 91
    sget p1, Lcom/appsflyer/internal/AFe1sSDK;->$10:I

    .line 92
    .line 93
    add-int/lit8 p1, p1, 0x17

    .line 94
    .line 95
    rem-int/lit16 p1, p1, 0x80

    .line 96
    .line 97
    sput p1, Lcom/appsflyer/internal/AFe1sSDK;->$11:I

    .line 98
    .line 99
    new-array p1, p0, [C

    .line 100
    .line 101
    iput v2, v0, Lcom/appsflyer/internal/AFk1ySDK;->AFAdRevenueData:I

    .line 102
    .line 103
    :goto_1
    iget p2, v0, Lcom/appsflyer/internal/AFk1ySDK;->AFAdRevenueData:I

    .line 104
    .line 105
    if-ge p2, p0, :cond_3

    .line 106
    .line 107
    sub-int p3, p0, p2

    .line 108
    .line 109
    add-int/lit8 p3, p3, -0x1

    .line 110
    .line 111
    aget-char p3, v1, p3

    .line 112
    .line 113
    aput-char p3, p1, p2

    .line 114
    .line 115
    add-int/lit8 p2, p2, 0x1

    .line 116
    .line 117
    iput p2, v0, Lcom/appsflyer/internal/AFk1ySDK;->AFAdRevenueData:I

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_3
    move-object v1, p1

    .line 121
    :cond_4
    new-instance p0, Ljava/lang/String;

    .line 122
    .line 123
    invoke-direct {p0, v1}, Ljava/lang/String;-><init>([C)V

    .line 124
    .line 125
    .line 126
    aput-object p0, p5, v2

    .line 127
    .line 128
    return-void
.end method

.method private getCurrencyIso4217Code(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;Z)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/appsflyer/internal/AFe1jSDK;",
            "Lcom/appsflyer/internal/AFe1gSDK<",
            "TT;>;Z)",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "TT;>;"
        }
    .end annotation

    .line 246
    iput-boolean p3, p1, Lcom/appsflyer/internal/AFe1jSDK;->AFAdRevenueData:Z

    .line 247
    iget-object p0, p0, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue:Lcom/appsflyer/internal/AFe1tSDK;

    .line 248
    new-instance p3, Lcom/appsflyer/internal/AFe1rSDK;

    iget-object v0, p0, Lcom/appsflyer/internal/AFe1tSDK;->AFAdRevenueData:Ljava/util/concurrent/ExecutorService;

    iget-object p0, p0, Lcom/appsflyer/internal/AFe1tSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFe1nSDK;

    invoke-direct {p3, p1, v0, p0, p2}, Lcom/appsflyer/internal/AFe1rSDK;-><init>(Lcom/appsflyer/internal/AFe1jSDK;Ljava/util/concurrent/ExecutorService;Lcom/appsflyer/internal/AFe1nSDK;Lcom/appsflyer/internal/AFe1gSDK;)V

    .line 249
    sget p0, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    add-int/lit8 p0, p0, 0x73

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    return-object p3
.end method

.method private static synthetic getCurrencyIso4217Code([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    const/4 v0, 0x0

    aget-object v1, p0, v0

    check-cast v1, Lcom/appsflyer/internal/AFe1sSDK;

    const/4 v2, 0x1

    aget-object p0, p0, v2

    check-cast p0, Lcom/appsflyer/internal/AFh1lSDK;

    .line 240
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFa1mSDK;->getMediationNetwork()[B

    move-result-object v4

    .line 241
    new-instance v2, Lcom/appsflyer/internal/AFe1jSDK;

    .line 242
    iget-object v3, p0, Lcom/appsflyer/internal/AFa1mSDK;->component3:Ljava/lang/String;

    .line 243
    sget-object v6, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    const/4 v7, 0x1

    const-string v5, "POST"

    invoke-direct/range {v2 .. v7}, Lcom/appsflyer/internal/AFe1jSDK;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/util/Map;Z)V

    .line 244
    new-instance p0, Lcom/appsflyer/internal/AFe1lSDK;

    invoke-direct {p0}, Lcom/appsflyer/internal/AFe1lSDK;-><init>()V

    invoke-direct {v1, v2, p0}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;)Lcom/appsflyer/internal/AFe1rSDK;

    move-result-object p0

    sget v1, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    add-int/lit8 v1, v1, 0x79

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    rem-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_0

    const/16 v1, 0x11

    div-int/2addr v1, v0

    :cond_0
    return-object p0
.end method

.method private static varargs getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 250
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    long-to-int p1, p1

    const p2, 0x472b6b88

    const v0, -0x472b6b86

    invoke-static {p0, p2, v0, p1}, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private getCurrencyIso4217Code()Z
    .locals 4

    .line 245
    sget v0, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    add-int/lit8 v0, v0, 0x43

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    rem-int/lit8 v0, v0, 0x2

    iget-object p0, p0, Lcom/appsflyer/internal/AFe1sSDK;->getCurrencyIso4217Code:Lcom/appsflyer/AppsFlyerProperties;

    const/4 v1, 0x1

    const-string v2, "http_cache"

    const/4 v3, 0x0

    if-nez v0, :cond_0

    invoke-virtual {p0, v2, v3}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-nez p0, :cond_2

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v2, v1}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-nez p0, :cond_2

    :goto_0
    sget p0, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    add-int/lit8 p0, p0, 0x39

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_1

    const/16 p0, 0x3f

    div-int/2addr p0, v3

    :cond_1
    return v1

    :cond_2
    sget p0, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    add-int/lit8 p0, p0, 0x25

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_3

    const/16 p0, 0x4d

    div-int/2addr p0, v3

    :cond_3
    return v3
.end method

.method public static synthetic getMediationNetwork([Ljava/lang/Object;III)Ljava/lang/Object;
    .locals 20

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    mul-int/lit16 v3, v0, -0x206

    .line 8
    .line 9
    mul-int/lit16 v4, v1, -0x206

    .line 10
    .line 11
    add-int/2addr v3, v4

    .line 12
    not-int v4, v0

    .line 13
    not-int v5, v2

    .line 14
    or-int/2addr v4, v5

    .line 15
    not-int v5, v4

    .line 16
    or-int/2addr v5, v1

    .line 17
    mul-int/lit16 v5, v5, 0x207

    .line 18
    .line 19
    add-int/2addr v3, v5

    .line 20
    or-int/2addr v4, v1

    .line 21
    not-int v4, v4

    .line 22
    or-int v5, v0, v1

    .line 23
    .line 24
    or-int/2addr v5, v2

    .line 25
    not-int v5, v5

    .line 26
    or-int/2addr v4, v5

    .line 27
    mul-int/lit16 v4, v4, -0x207

    .line 28
    .line 29
    add-int/2addr v3, v4

    .line 30
    or-int/2addr v1, v2

    .line 31
    not-int v1, v1

    .line 32
    or-int/2addr v0, v1

    .line 33
    mul-int/lit16 v0, v0, 0x207

    .line 34
    .line 35
    add-int/2addr v3, v0

    .line 36
    const/4 v0, 0x1

    .line 37
    if-eq v3, v0, :cond_2

    .line 38
    .line 39
    const/4 v1, 0x2

    .line 40
    if-eq v3, v1, :cond_1

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    aget-object v3, p0, v2

    .line 44
    .line 45
    check-cast v3, Lcom/appsflyer/internal/AFe1sSDK;

    .line 46
    .line 47
    aget-object v4, p0, v0

    .line 48
    .line 49
    check-cast v4, Ljava/lang/String;

    .line 50
    .line 51
    aget-object v1, p0, v1

    .line 52
    .line 53
    check-cast v1, Ljava/util/Map;

    .line 54
    .line 55
    const/4 v5, 0x3

    .line 56
    aget-object v5, p0, v5

    .line 57
    .line 58
    check-cast v5, Ljava/lang/String;

    .line 59
    .line 60
    const/4 v6, 0x4

    .line 61
    aget-object v6, p0, v6

    .line 62
    .line 63
    check-cast v6, Ljava/util/UUID;

    .line 64
    .line 65
    const/4 v7, 0x5

    .line 66
    aget-object v8, p0, v7

    .line 67
    .line 68
    check-cast v8, Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    new-instance v9, Ljava/util/HashMap;

    .line 75
    .line 76
    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v10, "ttl"

    .line 80
    .line 81
    const-string v11, "-1"

    .line 82
    .line 83
    invoke-interface {v9, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    const-string v10, "uuid"

    .line 87
    .line 88
    invoke-interface {v9, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    const-string v10, "data"

    .line 92
    .line 93
    invoke-interface {v9, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    const-string v1, "meta"

    .line 97
    .line 98
    invoke-direct {v3}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue()Ljava/util/Map;

    .line 99
    .line 100
    .line 101
    move-result-object v10

    .line 102
    invoke-interface {v9, v1, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    if-eqz v5, :cond_0

    .line 106
    .line 107
    sget v1, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    .line 108
    .line 109
    add-int/lit8 v1, v1, 0x7

    .line 110
    .line 111
    rem-int/lit16 v1, v1, 0x80

    .line 112
    .line 113
    sput v1, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    .line 114
    .line 115
    const-string v1, "brand_domain"

    .line 116
    .line 117
    invoke-interface {v9, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    :cond_0
    invoke-static {v9}, Lcom/appsflyer/internal/AFa1pSDK;->getRevenue(Ljava/util/Map;)Lorg/json/JSONObject;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    new-instance v13, Ljava/util/HashMap;

    .line 129
    .line 130
    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    .line 134
    .line 135
    .line 136
    move-result-wide v9

    .line 137
    const-wide/16 v11, 0x0

    .line 138
    .line 139
    cmp-long v5, v9, v11

    .line 140
    .line 141
    add-int/lit8 v14, v5, 0xb

    .line 142
    .line 143
    const-string v5, ""

    .line 144
    .line 145
    invoke-static {v5}, Landroid/view/MotionEvent;->axisFromString(Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    move-result v9

    .line 149
    add-int/lit8 v16, v9, 0x5

    .line 150
    .line 151
    invoke-static {v5, v5, v2, v2}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;II)I

    .line 152
    .line 153
    .line 154
    move-result v5

    .line 155
    add-int/lit16 v5, v5, 0xe6

    .line 156
    .line 157
    new-array v7, v0, [Ljava/lang/Object;

    .line 158
    .line 159
    const-string v15, "\ufff3\uffcd\u0006\uffe1\u0005\u0012\u0015\u0014\u0001\u000e\u0007\t"

    .line 160
    .line 161
    const/16 v17, 0x1

    .line 162
    .line 163
    move/from16 v18, v5

    .line 164
    .line 165
    move-object/from16 v19, v7

    .line 166
    .line 167
    invoke-static/range {v14 .. v19}, Lcom/appsflyer/internal/AFe1sSDK;->a(ILjava/lang/String;IZI[Ljava/lang/Object;)V

    .line 168
    .line 169
    .line 170
    aget-object v2, v19, v2

    .line 171
    .line 172
    check-cast v2, Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    const-string v5, "POST"

    .line 179
    .line 180
    filled-new-array {v5, v1}, [Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    filled-new-array {v8, v6, v5}, [Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v5

    .line 188
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 189
    .line 190
    .line 191
    move-result-wide v6

    .line 192
    long-to-int v6, v6

    .line 193
    const v7, 0x472b6b88

    .line 194
    .line 195
    .line 196
    const v8, -0x472b6b86

    .line 197
    .line 198
    .line 199
    invoke-static {v5, v7, v8, v6}, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v5

    .line 203
    check-cast v5, Ljava/lang/String;

    .line 204
    .line 205
    invoke-interface {v13, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    new-instance v9, Lcom/appsflyer/internal/AFe1jSDK;

    .line 209
    .line 210
    new-instance v2, Ljava/lang/StringBuilder;

    .line 211
    .line 212
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 213
    .line 214
    .line 215
    sget-object v5, Lcom/appsflyer/internal/AFe1sSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 216
    .line 217
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    .line 218
    .line 219
    .line 220
    move-result-object v6

    .line 221
    invoke-virtual {v6}, Lcom/appsflyer/AppsFlyerLib;->getHostPrefix()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v6

    .line 225
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFb1tSDK;

    .line 226
    .line 227
    .line 228
    move-result-object v7

    .line 229
    invoke-virtual {v7}, Lcom/appsflyer/AppsFlyerLib;->getHostName()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v7

    .line 233
    filled-new-array {v6, v7}, [Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v6

    .line 237
    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v5

    .line 241
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    const-string v5, "/"

    .line 245
    .line 246
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v10

    .line 256
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 261
    .line 262
    .line 263
    move-result-object v11

    .line 264
    const-string v12, "POST"

    .line 265
    .line 266
    const/4 v14, 0x0

    .line 267
    invoke-direct/range {v9 .. v14}, Lcom/appsflyer/internal/AFe1jSDK;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/util/Map;Z)V

    .line 268
    .line 269
    .line 270
    new-instance v1, Lcom/appsflyer/internal/AFe1lSDK;

    .line 271
    .line 272
    invoke-direct {v1}, Lcom/appsflyer/internal/AFe1lSDK;-><init>()V

    .line 273
    .line 274
    .line 275
    invoke-direct {v3, v9, v1, v0}, Lcom/appsflyer/internal/AFe1sSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;Z)Lcom/appsflyer/internal/AFe1rSDK;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    sget v1, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    .line 280
    .line 281
    add-int/lit8 v1, v1, 0x5d

    .line 282
    .line 283
    rem-int/lit16 v1, v1, 0x80

    .line 284
    .line 285
    sput v1, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    .line 286
    .line 287
    return-object v0

    .line 288
    :cond_1
    invoke-static/range {p0 .. p0}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue([Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    return-object v0

    .line 293
    :cond_2
    invoke-static/range {p0 .. p0}, Lcom/appsflyer/internal/AFe1sSDK;->getCurrencyIso4217Code([Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    return-object v0
.end method

.method public static getMonetizationNetwork()V
    .locals 1

    const v0, -0x4a95d788

    .line 287
    sput v0, Lcom/appsflyer/internal/AFe1sSDK;->component1:I

    return-void
.end method

.method private getRevenue(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/appsflyer/internal/AFe1jSDK;",
            "Lcom/appsflyer/internal/AFe1gSDK<",
            "TT;>;)",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "TT;>;"
        }
    .end annotation

    .line 161
    sget v0, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    add-int/lit8 v0, v0, 0x33

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    .line 162
    invoke-direct {p0}, Lcom/appsflyer/internal/AFe1sSDK;->getCurrencyIso4217Code()Z

    move-result v0

    .line 163
    invoke-direct {p0, p1, p2, v0}, Lcom/appsflyer/internal/AFe1sSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;Z)Lcom/appsflyer/internal/AFe1rSDK;

    move-result-object p0

    return-object p0

    .line 164
    :cond_0
    invoke-direct {p0}, Lcom/appsflyer/internal/AFe1sSDK;->getCurrencyIso4217Code()Z

    move-result v0

    .line 165
    invoke-direct {p0, p1, p2, v0}, Lcom/appsflyer/internal/AFe1sSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;Z)Lcom/appsflyer/internal/AFe1rSDK;

    const/4 p0, 0x0

    throw p0
.end method

.method private static synthetic getRevenue([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    const/4 v0, 0x0

    aget-object v1, p0, v0

    check-cast v1, Ljava/lang/String;

    const/4 v2, 0x1

    aget-object v3, p0, v2

    check-cast v3, Ljava/lang/String;

    const/4 v4, 0x2

    aget-object p0, p0, v4

    check-cast p0, [Ljava/lang/String;

    .line 173
    new-instance v5, Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-direct {v5, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 174
    const-string p0, "v2"

    invoke-interface {v5, v2, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 175
    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v5, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 176
    const-string v2, "\u2063"

    invoke-static {v2, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 177
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    .line 178
    invoke-static {v0, p0}, Lcom/appsflyer/internal/AFb1iSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget v0, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    add-int/lit8 v0, v0, 0x41

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    rem-int/2addr v0, v4

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method private getRevenue()Ljava/util/Map;
    .locals 10
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "build_number"

    .line 7
    .line 8
    const-string v2, "6.15.0"

    .line 9
    .line 10
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    .line 16
    .line 17
    const-string v2, "appsFlyerCount"

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-interface {v1, v2, v3}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "counter"

    .line 29
    .line 30
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    const-string v1, "model"

    .line 34
    .line 35
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 36
    .line 37
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollBarSize()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    shr-int/lit8 v1, v1, 0x8

    .line 45
    .line 46
    add-int/lit8 v4, v1, 0x5

    .line 47
    .line 48
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    shr-int/lit8 v1, v1, 0x10

    .line 53
    .line 54
    add-int/lit8 v6, v1, 0x5

    .line 55
    .line 56
    invoke-static {}, Landroid/view/KeyEvent;->getMaxKeyCode()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    shr-int/lit8 v1, v1, 0x10

    .line 61
    .line 62
    add-int/lit16 v8, v1, 0xed

    .line 63
    .line 64
    const/4 v1, 0x1

    .line 65
    new-array v9, v1, [Ljava/lang/Object;

    .line 66
    .line 67
    const-string v5, "\ufffb\u000b\ufffa\u0007\ufffd"

    .line 68
    .line 69
    const/4 v7, 0x0

    .line 70
    invoke-static/range {v4 .. v9}, Lcom/appsflyer/internal/AFe1sSDK;->a(ILjava/lang/String;IZI[Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    aget-object v1, v9, v3

    .line 74
    .line 75
    check-cast v1, Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 82
    .line 83
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 87
    .line 88
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    const-string v2, "sdk"

    .line 93
    .line 94
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 98
    .line 99
    iget-object v1, v1, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 100
    .line 101
    iget-object v1, v1, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 102
    .line 103
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-static {v1, v2}, Lcom/appsflyer/internal/AFb1vSDK;->getMonetizationNetwork(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    const-string v2, "app_version_name"

    .line 112
    .line 113
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 117
    .line 118
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    const-string v1, "app_id"

    .line 127
    .line 128
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    new-instance p0, Lcom/appsflyer/internal/AFb1aSDK;

    .line 132
    .line 133
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1aSDK;-><init>()V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1aSDK;->AFAdRevenueData()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    const-string v1, "platformextension"

    .line 141
    .line 142
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    sget p0, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    .line 146
    .line 147
    add-int/lit8 p0, p0, 0x2d

    .line 148
    .line 149
    rem-int/lit16 v1, p0, 0x80

    .line 150
    .line 151
    sput v1, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    .line 152
    .line 153
    rem-int/lit8 p0, p0, 0x2

    .line 154
    .line 155
    if-eqz p0, :cond_0

    .line 156
    .line 157
    const/16 p0, 0x17

    .line 158
    .line 159
    div-int/2addr p0, v3

    .line 160
    :cond_0
    return-object v0
.end method


# virtual methods
.method public final AFAdRevenueData(Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 6
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
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/appsflyer/internal/AFe1jSDK;

    .line 2
    .line 3
    sget-object v4, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 4
    .line 5
    const/4 v5, 0x0

    .line 6
    const/4 v2, 0x0

    .line 7
    const-string v3, "GET"

    .line 8
    .line 9
    move-object v1, p1

    .line 10
    invoke-direct/range {v0 .. v5}, Lcom/appsflyer/internal/AFe1jSDK;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/util/Map;Z)V

    .line 11
    .line 12
    .line 13
    const/16 p1, 0x2710

    .line 14
    .line 15
    iput p1, v0, Lcom/appsflyer/internal/AFe1jSDK;->component1:I

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-boolean p1, v0, Lcom/appsflyer/internal/AFe1jSDK;->getCurrencyIso4217Code:Z

    .line 19
    .line 20
    new-instance p1, Lcom/appsflyer/internal/AFe1lSDK;

    .line 21
    .line 22
    invoke-direct {p1}, Lcom/appsflyer/internal/AFe1lSDK;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0, v0, p1}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;)Lcom/appsflyer/internal/AFe1rSDK;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget p1, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    .line 30
    .line 31
    add-int/lit8 p1, p1, 0x39

    .line 32
    .line 33
    rem-int/lit16 p1, p1, 0x80

    .line 34
    .line 35
    sput p1, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    .line 36
    .line 37
    return-object p0
.end method

.method public final getCurrencyIso4217Code(Lcom/appsflyer/internal/AFa1mSDK;Ljava/lang/String;Lcom/appsflyer/internal/AFd1kSDK;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 18
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/AFa1mSDK;",
            "Ljava/lang/String;",
            "Lcom/appsflyer/internal/AFd1kSDK;",
            ")",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p1

    const v1, -0x3e029ca3

    .line 228
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 229
    sget v2, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    add-int/lit8 v2, v2, 0x17

    rem-int/lit16 v3, v2, 0x80

    sput v3, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    const/4 v3, 0x2

    rem-int/2addr v2, v3

    const-class v4, Lcom/appsflyer/internal/AFd1kSDK;

    const-class v5, Ljava/lang/String;

    const-class v6, Lcom/appsflyer/internal/AFa1mSDK;

    const-string v7, "getCurrencyIso4217Code"

    const/4 v8, 0x3

    const/4 v9, 0x0

    const-string v10, ""

    const/4 v11, 0x1

    const/4 v12, 0x0

    if-nez v2, :cond_2

    .line 230
    :try_start_0
    new-array v2, v8, [Ljava/lang/Object;

    aput-object p3, v2, v3

    aput-object p2, v2, v11

    aput-object v0, v2, v12

    sget-object v3, Lcom/appsflyer/internal/AFa1tSDK;->AFLogger:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v8

    shr-int/lit8 v8, v8, 0x10

    add-int/lit8 v8, v8, 0x49

    invoke-static {v10}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I

    move-result v10

    rsub-int/lit8 v10, v10, 0x21

    const/4 v11, 0x0

    invoke-static {v11, v11}, Landroid/graphics/PointF;->length(FF)F

    move-result v13

    cmpl-float v11, v13, v11

    int-to-char v11, v11

    invoke-static {v8, v10, v11}, Lcom/appsflyer/internal/AFa1tSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Class;

    filled-new-array {v6, v5, v4}, [Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v8, v7, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-interface {v3, v1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    check-cast v8, Ljava/lang/reflect/Method;

    invoke-virtual {v8, v9, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 v2, 0x15

    .line 231
    :try_start_1
    div-int/2addr v2, v12

    :goto_1
    move-object v4, v1

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_4

    :catchall_1
    move-exception v0

    .line 232
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1

    throw v1

    :cond_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    :try_start_2
    new-array v2, v8, [Ljava/lang/Object;

    aput-object p3, v2, v3

    aput-object p2, v2, v11

    aput-object v0, v2, v12

    sget-object v3, Lcom/appsflyer/internal/AFa1tSDK;->AFLogger:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_3

    goto :goto_2

    :cond_3
    const/16 v8, 0x30

    invoke-static {v10, v8}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;C)I

    move-result v13

    rsub-int/lit8 v13, v13, 0x48

    invoke-static {v10, v8, v12}, Landroid/text/TextUtils;->lastIndexOf(Ljava/lang/CharSequence;CI)I

    move-result v8

    add-int/lit8 v8, v8, 0x22

    invoke-static {}, Landroid/os/Process;->getElapsedCpuTime()J

    move-result-wide v14

    const-wide/16 v16, 0x0

    cmp-long v10, v14, v16

    sub-int/2addr v11, v10

    int-to-char v10, v11

    invoke-static {v13, v8, v10}, Lcom/appsflyer/internal/AFa1tSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Class;

    filled-new-array {v6, v5, v4}, [Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v8, v7, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-interface {v3, v1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    check-cast v8, Ljava/lang/reflect/Method;

    invoke-virtual {v8, v9, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_1

    .line 233
    :goto_3
    new-instance v2, Lcom/appsflyer/internal/AFe1jSDK;

    .line 234
    iget-object v3, v0, Lcom/appsflyer/internal/AFa1mSDK;->component3:Ljava/lang/String;

    .line 235
    sget-object v6, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 236
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork()Z

    move-result v7

    const-string v5, "POST"

    invoke-direct/range {v2 .. v7}, Lcom/appsflyer/internal/AFe1jSDK;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/util/Map;Z)V

    .line 237
    new-instance v0, Lcom/appsflyer/internal/AFe1lSDK;

    invoke-direct {v0}, Lcom/appsflyer/internal/AFe1lSDK;-><init>()V

    move-object/from16 v1, p0

    invoke-direct {v1, v2, v0}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;)Lcom/appsflyer/internal/AFe1rSDK;

    move-result-object v0

    return-object v0

    :catchall_2
    move-exception v0

    .line 238
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_4

    throw v1

    :cond_4
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 239
    :goto_4
    const-string v1, "AFFinalizer: reflection init failed"

    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v9
.end method

.method public final getCurrencyIso4217Code(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 9
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const v0, 0x2c5e7e4e

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x2

    .line 9
    const/4 v2, 0x0

    .line 10
    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    aput-object p2, v1, v3

    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    aput-object p1, v1, p2

    .line 17
    .line 18
    sget-object p1, Lcom/appsflyer/internal/AFa1tSDK;->AFLogger:Ljava/util/Map;

    .line 19
    .line 20
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->currentThreadTimeMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide v3

    .line 31
    const-wide/16 v5, -0x1

    .line 32
    .line 33
    cmp-long p2, v3, v5

    .line 34
    .line 35
    add-int/lit8 p2, p2, 0x48

    .line 36
    .line 37
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollDefaultDelay()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    shr-int/lit8 v3, v3, 0x10

    .line 42
    .line 43
    rsub-int/lit8 v3, v3, 0x21

    .line 44
    .line 45
    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    shr-int/lit8 v4, v4, 0x10

    .line 50
    .line 51
    int-to-char v4, v4

    .line 52
    invoke-static {p2, v3, v4}, Lcom/appsflyer/internal/AFa1tSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    check-cast p2, Ljava/lang/Class;

    .line 57
    .line 58
    const-string v3, "getRevenue"

    .line 59
    .line 60
    const-class v4, Ljava/util/Map;

    .line 61
    .line 62
    const-class v5, Ljava/lang/String;

    .line 63
    .line 64
    filled-new-array {v4, v5}, [Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {p2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    :goto_0
    check-cast p2, Ljava/lang/reflect/Method;

    .line 76
    .line 77
    invoke-virtual {p2, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    move-object v5, p1

    .line 82
    check-cast v5, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    .line 84
    new-instance p1, Lcom/appsflyer/internal/AFj1mSDK;

    .line 85
    .line 86
    iget-object p2, p0, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 87
    .line 88
    invoke-direct {p1, p2}, Lcom/appsflyer/internal/AFj1mSDK;-><init>(Lcom/appsflyer/internal/AFd1pSDK;)V

    .line 89
    .line 90
    .line 91
    if-eqz p3, :cond_3

    .line 92
    .line 93
    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    if-nez p2, :cond_1

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_1
    sget p2, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    .line 101
    .line 102
    add-int/lit8 p2, p2, 0x31

    .line 103
    .line 104
    rem-int/lit16 p2, p2, 0x80

    .line 105
    .line 106
    sput p2, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    .line 107
    .line 108
    new-instance p2, Lkotlin/text/Regex;

    .line 109
    .line 110
    const-string v0, "4.?(\\d+)?.?(\\d+)"

    .line 111
    .line 112
    invoke-direct {p2, v0}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p2, p3}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    if-nez p2, :cond_3

    .line 120
    .line 121
    new-instance p2, Lkotlin/text/Regex;

    .line 122
    .line 123
    const-string v0, "3.?(\\d+)?.?(\\d+)"

    .line 124
    .line 125
    invoke-direct {p2, v0}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p2, p3}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    if-eqz p2, :cond_2

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_2
    iget-object p2, p1, Lcom/appsflyer/internal/AFj1mSDK;->getRevenue:Lcom/appsflyer/internal/AFj1lSDK;

    .line 136
    .line 137
    const-string p3, "https://%sviap.%s/api/v1/android/validate_purchase_v2?app_id="

    .line 138
    .line 139
    invoke-interface {p2, p3}, Lcom/appsflyer/internal/AFj1lSDK;->AFAdRevenueData(Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    goto :goto_2

    .line 144
    :cond_3
    :goto_1
    sget p2, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    .line 145
    .line 146
    add-int/lit8 p2, p2, 0x67

    .line 147
    .line 148
    rem-int/lit16 p2, p2, 0x80

    .line 149
    .line 150
    sput p2, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    .line 151
    .line 152
    iget-object p2, p1, Lcom/appsflyer/internal/AFj1mSDK;->getRevenue:Lcom/appsflyer/internal/AFj1lSDK;

    .line 153
    .line 154
    const-string p3, "https://%sviap.%s/api/v1/android/validate_purchase?app_id="

    .line 155
    .line 156
    invoke-interface {p2, p3}, Lcom/appsflyer/internal/AFj1lSDK;->AFAdRevenueData(Ljava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    :goto_2
    new-instance p3, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-object p2, p1, Lcom/appsflyer/internal/AFj1mSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 169
    .line 170
    iget-object p2, p2, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 171
    .line 172
    iget-object p2, p2, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 173
    .line 174
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    invoke-virtual {p1, p2}, Lcom/appsflyer/internal/AFj1mSDK;->getMediationNetwork(Ljava/lang/String;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    new-instance v3, Lcom/appsflyer/internal/AFe1jSDK;

    .line 190
    .line 191
    sget-object v7, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 192
    .line 193
    const/4 v8, 0x1

    .line 194
    const-string v6, "POST"

    .line 195
    .line 196
    invoke-direct/range {v3 .. v8}, Lcom/appsflyer/internal/AFe1jSDK;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/util/Map;Z)V

    .line 197
    .line 198
    .line 199
    new-instance p1, Lcom/appsflyer/internal/AFe1lSDK;

    .line 200
    .line 201
    invoke-direct {p1}, Lcom/appsflyer/internal/AFe1lSDK;-><init>()V

    .line 202
    .line 203
    .line 204
    invoke-direct {p0, v3, p1}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;)Lcom/appsflyer/internal/AFe1rSDK;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    return-object p0

    .line 209
    :catchall_0
    move-exception v0

    .line 210
    move-object p0, v0

    .line 211
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    if-eqz p1, :cond_4

    .line 216
    .line 217
    throw p1

    .line 218
    :catch_0
    move-exception v0

    .line 219
    move-object p0, v0

    .line 220
    goto :goto_3

    .line 221
    :cond_4
    throw p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 222
    :goto_3
    const-string p1, "AFFinalizer: reflection init failed"

    .line 223
    .line 224
    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 225
    .line 226
    .line 227
    return-object v2
.end method

.method public final getMediationNetwork(Lcom/appsflyer/internal/AFh1lSDK;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/AFh1lSDK;",
            ")",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 345
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v0, -0x1f787c3b

    const v1, 0x1f787c3c

    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/internal/AFe1rSDK;

    return-object p0
.end method

.method public final getMediationNetwork(Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 16
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/UUID;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            ")",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    .line 323
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 324
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/appsflyer/internal/AFe1sSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 325
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v5

    invoke-virtual {v5}, Lcom/appsflyer/AppsFlyerLib;->getHostPrefix()Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFb1tSDK;

    move-result-object v6

    invoke-virtual {v6}, Lcom/appsflyer/AppsFlyerLib;->getHostName()Ljava/lang/String;

    move-result-object v6

    filled-new-array {v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 326
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "?id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 327
    invoke-direct/range {p0 .. p0}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue()Ljava/util/Map;

    move-result-object v3

    .line 328
    const-string v4, "build_number"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 329
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 330
    const-string v5, "Af-UUID"

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v9, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    const-string v5, "Af-Meta-Sdk-Ver"

    invoke-interface {v9, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    const-string v5, "counter"

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "Af-Meta-Counter"

    invoke-interface {v9, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    const-string v5, "model"

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "Af-Meta-Model"

    invoke-interface {v9, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    const-string v5, "platformextension"

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "Af-Meta-Platform"

    invoke-interface {v9, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    const-string v5, "sdk"

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "Af-Meta-System-Version"

    invoke-interface {v9, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, 0x0

    .line 336
    invoke-static {v3, v3}, Landroid/graphics/drawable/Drawable;->resolveOpacity(II)I

    move-result v5

    rsub-int/lit8 v10, v5, 0xc

    const-string v5, ""

    const/16 v7, 0x30

    invoke-static {v5, v7}, Landroid/text/TextUtils;->lastIndexOf(Ljava/lang/CharSequence;C)I

    move-result v5

    rsub-int/lit8 v12, v5, 0x3

    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    move-result v5

    shr-int/lit8 v5, v5, 0x10

    add-int/lit16 v14, v5, 0xe6

    const/4 v5, 0x1

    new-array v15, v5, [Ljava/lang/Object;

    const-string v11, "\ufff3\uffcd\u0006\uffe1\u0005\u0012\u0015\u0014\u0001\u000e\u0007\t"

    const/4 v13, 0x1

    invoke-static/range {v10 .. v15}, Lcom/appsflyer/internal/AFe1sSDK;->a(ILjava/lang/String;IZI[Ljava/lang/Object;)V

    aget-object v3, v15, v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v3

    const-string v8, "GET"

    filled-new-array {v8, v2, v0, v1, v4}, [Ljava/lang/String;

    move-result-object v0

    move-object/from16 v1, p4

    filled-new-array {v1, v2, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    long-to-int v1, v1

    const v2, 0x472b6b88

    const v4, -0x472b6b86

    invoke-static {v0, v2, v4, v1}, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v9, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    new-instance v5, Lcom/appsflyer/internal/AFe1jSDK;

    const/4 v7, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/appsflyer/internal/AFe1jSDK;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/util/Map;Z)V

    .line 338
    new-instance v0, Lcom/appsflyer/internal/AFe1hSDK;

    invoke-direct {v0}, Lcom/appsflyer/internal/AFe1hSDK;-><init>()V

    move-object/from16 v1, p0

    invoke-direct {v1, v5, v0}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;)Lcom/appsflyer/internal/AFe1rSDK;

    move-result-object v0

    sget v1, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    add-int/lit8 v1, v1, 0xf

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    rem-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    throw v0
.end method

.method public final getMediationNetwork(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/UUID;Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/util/UUID;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            ")",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 344
    filled-new-array/range {p0 .. p5}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const p2, -0x27fa9dde

    const p3, 0x27fa9dde

    invoke-static {p1, p2, p3, p0}, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/internal/AFe1rSDK;

    return-object p0
.end method

.method public final getMediationNetwork(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 11
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const v0, 0x2c5e7e4e

    .line 298
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 299
    sget v1, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    add-int/lit8 v1, v1, 0x27

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    .line 300
    :try_start_0
    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 p2, 0x0

    aput-object p1, v3, p2

    sget-object p1, Lcom/appsflyer/internal/AFa1tSDK;->AFLogger:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/media/AudioTrack;->getMinVolume()F

    move-result v4

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    add-int/lit8 v4, v4, 0x49

    invoke-static {}, Landroid/os/Process;->getElapsedCpuTime()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    add-int/lit8 v5, v5, 0x20

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v9

    cmp-long v6, v9, v7

    add-int/lit8 v6, v6, -0x1

    int-to-char v6, v6

    invoke-static {v4, v5, v6}, Lcom/appsflyer/internal/AFa1tSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    const-string v5, "getRevenue"

    const-class v6, Ljava/util/Map;

    const-class v7, Ljava/lang/String;

    filled-new-array {v6, v7}, [Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-interface {p1, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    check-cast v4, Ljava/lang/reflect/Method;

    invoke-virtual {v4, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v5, p1

    check-cast v5, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 301
    new-instance p1, Lcom/appsflyer/internal/AFj1mSDK;

    iget-object v0, p0, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    invoke-direct {p1, v0}, Lcom/appsflyer/internal/AFj1mSDK;-><init>(Lcom/appsflyer/internal/AFd1pSDK;)V

    if-eqz p3, :cond_3

    .line 302
    sget v0, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    add-int/lit8 v0, v0, 0x6d

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    .line 303
    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "4.?(\\d+)?.?(\\d+)"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    .line 304
    invoke-virtual {v0, p3}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "3.?(\\d+)?.?(\\d+)"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_2

    goto :goto_1

    .line 305
    :cond_2
    iget-object p2, p1, Lcom/appsflyer/internal/AFj1mSDK;->getRevenue:Lcom/appsflyer/internal/AFj1lSDK;

    const-string p3, "https://%sars.%s/api/v2/android/validate_subscription_v2?app_id="

    invoke-interface {p2, p3}, Lcom/appsflyer/internal/AFj1lSDK;->AFAdRevenueData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_2

    .line 306
    :cond_3
    :goto_1
    sget p3, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    add-int/lit8 p3, p3, 0x7

    rem-int/lit16 v0, p3, 0x80

    sput v0, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    rem-int/2addr p3, v2

    .line 307
    iget-object v0, p1, Lcom/appsflyer/internal/AFj1mSDK;->getRevenue:Lcom/appsflyer/internal/AFj1lSDK;

    .line 308
    const-string v1, "https://%sars.%s/api/v2/android/validate_subscription?app_id="

    if-eqz p3, :cond_4

    .line 309
    invoke-interface {v0, v1}, Lcom/appsflyer/internal/AFj1lSDK;->AFAdRevenueData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const/16 v0, 0x9

    .line 310
    div-int/2addr v0, p2

    move-object p2, p3

    goto :goto_2

    .line 311
    :cond_4
    invoke-interface {v0, v1}, Lcom/appsflyer/internal/AFj1lSDK;->AFAdRevenueData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 312
    :goto_2
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p1, Lcom/appsflyer/internal/AFj1mSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 313
    iget-object p2, p2, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 314
    iget-object p2, p2, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 315
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p2

    .line 316
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    .line 317
    invoke-virtual {p1, p2}, Lcom/appsflyer/internal/AFj1mSDK;->getMediationNetwork(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 318
    new-instance v3, Lcom/appsflyer/internal/AFe1jSDK;

    .line 319
    sget-object v7, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    const/4 v8, 0x1

    const-string v6, "POST"

    invoke-direct/range {v3 .. v8}, Lcom/appsflyer/internal/AFe1jSDK;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/util/Map;Z)V

    .line 320
    new-instance p1, Lcom/appsflyer/internal/AFe1lSDK;

    invoke-direct {p1}, Lcom/appsflyer/internal/AFe1lSDK;-><init>()V

    invoke-direct {p0, v3, p1}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;)Lcom/appsflyer/internal/AFe1rSDK;

    move-result-object p0

    return-object p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    .line 321
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_5

    throw p1

    :catch_0
    move-exception v0

    move-object p0, v0

    goto :goto_3

    :cond_5
    throw p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 322
    :goto_3
    const-string p1, "AFFinalizer: reflection init failed"

    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v1
.end method

.method public final getMediationNetwork(Ljava/util/Map;Ljava/lang/String;)Lcom/appsflyer/internal/AFe1wSDK;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/appsflyer/internal/AFe1wSDK;"
        }
    .end annotation

    const v0, 0x2c5e7e4e

    .line 339
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v3, 0x1

    aput-object p2, v1, v3

    const/4 p2, 0x0

    aput-object p1, v1, p2

    sget-object p1, Lcom/appsflyer/internal/AFa1tSDK;->AFLogger:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p2, p2}, Landroid/view/View;->resolveSize(II)I

    move-result v3

    add-int/lit8 v3, v3, 0x49

    invoke-static {}, Landroid/media/AudioTrack;->getMaxVolume()F

    move-result v4

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    rsub-int/lit8 v4, v4, 0x22

    invoke-static {p2, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    int-to-char p2, p2

    invoke-static {v3, v4, p2}, Lcom/appsflyer/internal/AFa1tSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Class;

    const-string v3, "getRevenue"

    const-class v4, Ljava/util/Map;

    const-class v5, Ljava/lang/String;

    filled-new-array {v4, v5}, [Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-interface {p1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    check-cast v3, Ljava/lang/reflect/Method;

    invoke-virtual {v3, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_1

    .line 340
    :try_start_1
    const-string p0, "AFFinalizer: failed to create bytes"

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "failed to create bytes from proxyData"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {p0, p1}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 341
    sget p0, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    add-int/lit8 p0, p0, 0xd

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    return-object v2

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_1
    sget p2, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    add-int/lit8 p2, p2, 0x19

    rem-int/lit16 p2, p2, 0x80

    sput p2, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    new-instance p2, Lcom/appsflyer/internal/AFe1wSDK;

    iget-object p0, p0, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    invoke-direct {p2, p0, p1}, Lcom/appsflyer/internal/AFe1wSDK;-><init>(Lcom/appsflyer/internal/AFd1pSDK;[B)V

    return-object p2

    :catchall_0
    move-exception p0

    .line 342
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_2

    throw p1

    :cond_2
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 343
    :goto_1
    const-string p1, "AFFinalizer: reflection init failed"

    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v2
.end method

.method public final getMonetizationNetwork(Lcom/appsflyer/internal/AFc1qSDK;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 7
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/AFc1qSDK;",
            ")",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "Lcom/appsflyer/internal/AFc1jSDK;",
            ">;"
        }
    .end annotation

    .line 280
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/internal/AFa1pSDK;->getRevenue(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 281
    new-instance v1, Lcom/appsflyer/internal/AFe1jSDK;

    .line 282
    iget-object v2, p1, Lcom/appsflyer/internal/AFa1mSDK;->component3:Ljava/lang/String;

    .line 283
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    .line 284
    sget-object v5, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 285
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork()Z

    move-result v6

    const-string v4, "POST"

    invoke-direct/range {v1 .. v6}, Lcom/appsflyer/internal/AFe1jSDK;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/util/Map;Z)V

    .line 286
    new-instance p1, Lcom/appsflyer/internal/AFc1pSDK;

    invoke-direct {p1}, Lcom/appsflyer/internal/AFc1pSDK;-><init>()V

    invoke-direct {p0, v1, p1}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;)Lcom/appsflyer/internal/AFe1rSDK;

    move-result-object p0

    sget p1, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    add-int/lit8 p1, p1, 0x7b

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    rem-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method public final getMonetizationNetwork(Ljava/util/Map;Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 11
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const v0, 0x2c5e7e4e

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget v1, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    .line 9
    .line 10
    add-int/lit8 v1, v1, 0x75

    .line 11
    .line 12
    rem-int/lit16 v2, v1, 0x80

    .line 13
    .line 14
    sput v2, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    rem-int/2addr v1, v2

    .line 18
    const-class v3, Ljava/lang/String;

    .line 19
    .line 20
    const-class v4, Ljava/util/Map;

    .line 21
    .line 22
    const-string v5, "getRevenue"

    .line 23
    .line 24
    const/4 v6, 0x1

    .line 25
    const/4 v7, 0x0

    .line 26
    const/4 v8, 0x0

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    :try_start_0
    new-array v1, v2, [Ljava/lang/Object;

    .line 30
    .line 31
    aput-object p2, v1, v6

    .line 32
    .line 33
    aput-object p1, v1, v8

    .line 34
    .line 35
    sget-object p1, Lcom/appsflyer/internal/AFa1tSDK;->AFLogger:Ljava/util/Map;

    .line 36
    .line 37
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    if-eqz p2, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-wide/16 v9, 0x0

    .line 45
    .line 46
    invoke-static {v9, v10}, Landroid/widget/ExpandableListView;->getPackedPositionType(J)I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    add-int/lit8 p2, p2, 0x49

    .line 51
    .line 52
    invoke-static {}, Landroid/media/AudioTrack;->getMaxVolume()F

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    const/4 v6, 0x0

    .line 57
    cmpl-float v2, v2, v6

    .line 58
    .line 59
    rsub-int/lit8 v2, v2, 0x22

    .line 60
    .line 61
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollBarSize()I

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    shr-int/lit8 v6, v6, 0x8

    .line 66
    .line 67
    int-to-char v6, v6

    .line 68
    invoke-static {p2, v2, v6}, Lcom/appsflyer/internal/AFa1tSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    check-cast p2, Ljava/lang/Class;

    .line 73
    .line 74
    filled-new-array {v4, v3}, [Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {p2, v5, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    :goto_0
    check-cast p2, Ljava/lang/reflect/Method;

    .line 86
    .line 87
    invoke-virtual {p2, v7, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 92
    .line 93
    const/16 p2, 0x1f

    .line 94
    .line 95
    :try_start_1
    div-int/2addr p2, v8

    .line 96
    :goto_1
    move-object v2, p1

    .line 97
    goto :goto_3

    .line 98
    :catchall_0
    move-exception v0

    .line 99
    move-object p0, v0

    .line 100
    move-object v3, p0

    .line 101
    goto/16 :goto_4

    .line 102
    .line 103
    :catchall_1
    move-exception v0

    .line 104
    move-object p0, v0

    .line 105
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    if-eqz p1, :cond_1

    .line 110
    .line 111
    throw p1

    .line 112
    :cond_1
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 113
    :cond_2
    :try_start_2
    new-array v1, v2, [Ljava/lang/Object;

    .line 114
    .line 115
    aput-object p2, v1, v6

    .line 116
    .line 117
    aput-object p1, v1, v8

    .line 118
    .line 119
    sget-object p1, Lcom/appsflyer/internal/AFa1tSDK;->AFLogger:Ljava/util/Map;

    .line 120
    .line 121
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    if-eqz p2, :cond_3

    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_3
    invoke-static {v8, v8}, Landroid/view/KeyEvent;->getDeadChar(II)I

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    add-int/lit8 p2, p2, 0x49

    .line 133
    .line 134
    invoke-static {}, Landroid/view/KeyEvent;->getMaxKeyCode()I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    shr-int/lit8 v2, v2, 0x10

    .line 139
    .line 140
    rsub-int/lit8 v2, v2, 0x21

    .line 141
    .line 142
    invoke-static {v8, v8}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 143
    .line 144
    .line 145
    move-result v6

    .line 146
    int-to-char v6, v6

    .line 147
    invoke-static {p2, v2, v6}, Lcom/appsflyer/internal/AFa1tSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p2

    .line 151
    check-cast p2, Ljava/lang/Class;

    .line 152
    .line 153
    filled-new-array {v4, v3}, [Ljava/lang/Class;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-virtual {p2, v5, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    :goto_2
    check-cast p2, Ljava/lang/reflect/Method;

    .line 165
    .line 166
    invoke-virtual {p2, v7, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    check-cast p1, [B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 171
    .line 172
    goto :goto_1

    .line 173
    :goto_3
    new-instance p1, Lcom/appsflyer/internal/AFj1mSDK;

    .line 174
    .line 175
    iget-object p2, p0, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 176
    .line 177
    invoke-direct {p1, p2}, Lcom/appsflyer/internal/AFj1mSDK;-><init>(Lcom/appsflyer/internal/AFd1pSDK;)V

    .line 178
    .line 179
    .line 180
    iget-object p2, p1, Lcom/appsflyer/internal/AFj1mSDK;->getRevenue:Lcom/appsflyer/internal/AFj1lSDK;

    .line 181
    .line 182
    const-string v0, "https://%svalidate-and-log.%s/api/v1.0/android/validateAndLog?app_id="

    .line 183
    .line 184
    invoke-interface {p2, v0}, Lcom/appsflyer/internal/AFj1lSDK;->AFAdRevenueData(Ljava/lang/String;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    new-instance v0, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    iget-object p1, p1, Lcom/appsflyer/internal/AFj1mSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 197
    .line 198
    iget-object p1, p1, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 199
    .line 200
    iget-object p1, p1, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 201
    .line 202
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    new-instance v0, Lcom/appsflyer/internal/AFe1jSDK;

    .line 214
    .line 215
    sget-object v4, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 216
    .line 217
    const/4 v5, 0x1

    .line 218
    const-string v3, "POST"

    .line 219
    .line 220
    invoke-direct/range {v0 .. v5}, Lcom/appsflyer/internal/AFe1jSDK;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/util/Map;Z)V

    .line 221
    .line 222
    .line 223
    new-instance p1, Lcom/appsflyer/internal/AFe1lSDK;

    .line 224
    .line 225
    invoke-direct {p1}, Lcom/appsflyer/internal/AFe1lSDK;-><init>()V

    .line 226
    .line 227
    .line 228
    invoke-direct {p0, v0, p1}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;)Lcom/appsflyer/internal/AFe1rSDK;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    sget p1, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    .line 233
    .line 234
    add-int/lit8 p1, p1, 0x55

    .line 235
    .line 236
    rem-int/lit16 p1, p1, 0x80

    .line 237
    .line 238
    sput p1, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    .line 239
    .line 240
    return-object p0

    .line 241
    :catchall_2
    move-exception v0

    .line 242
    move-object p0, v0

    .line 243
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    if-eqz p1, :cond_4

    .line 248
    .line 249
    throw p1

    .line 250
    :cond_4
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 251
    :goto_4
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 252
    .line 253
    sget-object v1, Lcom/appsflyer/internal/AFg1cSDK;->registerClient:Lcom/appsflyer/internal/AFg1cSDK;

    .line 254
    .line 255
    const/4 v4, 0x0

    .line 256
    const/4 v5, 0x0

    .line 257
    const-string v2, "AFFinalizer: reflection init failed"

    .line 258
    .line 259
    invoke-virtual/range {v0 .. v5}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;ZZ)V

    .line 260
    .line 261
    .line 262
    return-object v7
.end method

.method public final getMonetizationNetwork(ZZLjava/lang/String;I)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 2
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Ljava/lang/String;",
            "I)",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "Lcom/appsflyer/internal/AFh1aSDK;",
            ">;"
        }
    .end annotation

    .line 263
    sget p4, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    add-int/lit8 p4, p4, 0x1d

    rem-int/lit16 v0, p4, 0x80

    sput v0, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    rem-int/lit8 p4, p4, 0x2

    .line 264
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1sSDK;->component4:Lcom/appsflyer/internal/AFe1fSDK;

    if-nez p4, :cond_3

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_0

    .line 265
    sget-object p1, Lcom/appsflyer/internal/AFe1fSDK;->getMonetizationNetwork:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/appsflyer/internal/AFe1fSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 266
    :goto_0
    const-string p4, ""

    if-eqz p2, :cond_1

    .line 267
    sget p2, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    add-int/lit8 p2, p2, 0x41

    rem-int/lit16 p2, p2, 0x80

    sput p2, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    const-string p2, "stg"

    goto :goto_1

    :cond_1
    move-object p2, p4

    .line 268
    :goto_1
    sget-object v1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 269
    invoke-static {}, Lcom/appsflyer/internal/AFe1fSDK;->AFAdRevenueData()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 270
    iget-object p4, v0, Lcom/appsflyer/internal/AFe1fSDK;->getCurrencyIso4217Code:Lkotlin/Lazy;

    invoke-interface {p4}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    .line 271
    :cond_2
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFe1fSDK;->getMediationNetwork()Ljava/lang/String;

    move-result-object v0

    .line 272
    filled-new-array {p4, p2, v0, p3}, [Ljava/lang/Object;

    move-result-object p2

    const/4 p3, 0x4

    .line 273
    invoke-static {p2, p3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p2

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 274
    new-instance p2, Lcom/appsflyer/internal/AFe1jSDK;

    const-string p3, "GET"

    invoke-direct {p2, p1, p3}, Lcom/appsflyer/internal/AFe1jSDK;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/16 p1, 0x5dc

    .line 275
    iput p1, p2, Lcom/appsflyer/internal/AFe1jSDK;->component1:I

    .line 276
    new-instance p1, Lcom/appsflyer/internal/AFe1pSDK;

    invoke-direct {p1}, Lcom/appsflyer/internal/AFe1pSDK;-><init>()V

    invoke-direct {p0, p2, p1}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;)Lcom/appsflyer/internal/AFe1rSDK;

    move-result-object p0

    .line 277
    sget p1, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    add-int/lit8 p1, p1, 0x3d

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    return-object p0

    .line 278
    :cond_3
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    .line 279
    throw p0
.end method

.method public final getRevenue(Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 166
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 167
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 168
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 169
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 170
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 171
    iget-object v2, v1, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    iget-object v1, v1, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    invoke-static {v2, v1}, Lcom/appsflyer/internal/AFb1lSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFd1kSDK;Lcom/appsflyer/internal/AFd1rSDK;)Ljava/lang/String;

    move-result-object v1

    .line 172
    invoke-static {v0, v1, p1, p2}, Lcom/appsflyer/internal/AFe1qSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/internal/AFe1qSDK;

    move-result-object p1

    new-instance p2, Lcom/appsflyer/internal/AFe1mSDK;

    invoke-direct {p2}, Lcom/appsflyer/internal/AFe1mSDK;-><init>()V

    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/AFe1sSDK;->getRevenue(Lcom/appsflyer/internal/AFe1jSDK;Lcom/appsflyer/internal/AFe1gSDK;)Lcom/appsflyer/internal/AFe1rSDK;

    move-result-object p0

    sget p1, Lcom/appsflyer/internal/AFe1sSDK;->component2:I

    add-int/lit8 p1, p1, 0x49

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/AFe1sSDK;->areAllFieldsValid:I

    rem-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method
