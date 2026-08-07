.class public final Lcom/appsflyer/internal/AFg1eSDK;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/internal/AFg1fSDK;


# static fields
.field private static $10:I = 0x0

.field private static $11:I = 0x1

.field private static AFInAppEventType:I = 0x0

.field private static valueOf:[C = null

.field private static values:I = 0x1


# instance fields
.field private final AFAdRevenueData:Lcom/appsflyer/internal/AFi1lSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final AFKeystoreWrapper:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final component1:Lcom/appsflyer/internal/AFd1pSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final component2:Lcom/appsflyer/internal/AFh1qSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final component3:Lcom/appsflyer/internal/AFd1rSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final component4:Lcom/appsflyer/internal/AFi1xSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final copy:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final copydefault:Lcom/appsflyer/internal/AFg1kSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final equals:Lcom/appsflyer/internal/AFd1mSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1vSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final getMediationNetwork:Lcom/appsflyer/internal/AFb1zSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final getMonetizationNetwork:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final getRevenue:Lcom/appsflyer/internal/AFj1uSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final hashCode:Lcom/appsflyer/internal/AFb1aSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final toString:Lcom/appsflyer/internal/AFd1kSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    new-array v0, v0, [C

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/appsflyer/internal/AFg1eSDK;->valueOf:[C

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 2
        0x3512s
        0x3574s
        0x3542s
        0x3551s
        0x3550s
        0x354fs
        0x3545s
        0x3547s
        0x354es
        0x3548s
        0x3570s
        0x3574s
        0x3547s
        0x354as
        0x3553s
        0x35a9s
        0x343cs
        0x343ds
        0x343as
        0x343cs
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/appsflyer/internal/AFi1lSDK;Lcom/appsflyer/internal/AFd1vSDK;Lcom/appsflyer/internal/AFj1uSDK;Lcom/appsflyer/internal/AFb1zSDK;Lcom/appsflyer/internal/AFh1qSDK;Lcom/appsflyer/internal/AFd1rSDK;Lcom/appsflyer/internal/AFd1pSDK;Lcom/appsflyer/internal/AFi1xSDK;Lcom/appsflyer/internal/AFg1rSDK;Lcom/appsflyer/internal/AFb1aSDK;Lcom/appsflyer/internal/AFd1kSDK;Lcom/appsflyer/internal/AFg1kSDK;Lcom/appsflyer/internal/AFd1mSDK;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/appsflyer/internal/AFi1lSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/appsflyer/internal/AFd1vSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lcom/appsflyer/internal/AFj1uSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Lcom/appsflyer/internal/AFb1zSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Lcom/appsflyer/internal/AFh1qSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # Lcom/appsflyer/internal/AFd1rSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p8    # Lcom/appsflyer/internal/AFd1pSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p9    # Lcom/appsflyer/internal/AFi1xSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p10    # Lcom/appsflyer/internal/AFg1rSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p11    # Lcom/appsflyer/internal/AFb1aSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p12    # Lcom/appsflyer/internal/AFd1kSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p13    # Lcom/appsflyer/internal/AFg1kSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p14    # Lcom/appsflyer/internal/AFd1mSDK;
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 47
    .line 48
    iput-object p2, p0, Lcom/appsflyer/internal/AFg1eSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFi1lSDK;

    .line 49
    .line 50
    iput-object p3, p0, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1vSDK;

    .line 51
    .line 52
    iput-object p4, p0, Lcom/appsflyer/internal/AFg1eSDK;->getRevenue:Lcom/appsflyer/internal/AFj1uSDK;

    .line 53
    .line 54
    iput-object p5, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFb1zSDK;

    .line 55
    .line 56
    iput-object p6, p0, Lcom/appsflyer/internal/AFg1eSDK;->component2:Lcom/appsflyer/internal/AFh1qSDK;

    .line 57
    .line 58
    iput-object p7, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 59
    .line 60
    iput-object p8, p0, Lcom/appsflyer/internal/AFg1eSDK;->component1:Lcom/appsflyer/internal/AFd1pSDK;

    .line 61
    .line 62
    iput-object p9, p0, Lcom/appsflyer/internal/AFg1eSDK;->component4:Lcom/appsflyer/internal/AFi1xSDK;

    .line 63
    .line 64
    iput-object p10, p0, Lcom/appsflyer/internal/AFg1eSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 65
    .line 66
    iput-object p11, p0, Lcom/appsflyer/internal/AFg1eSDK;->hashCode:Lcom/appsflyer/internal/AFb1aSDK;

    .line 67
    .line 68
    iput-object p12, p0, Lcom/appsflyer/internal/AFg1eSDK;->toString:Lcom/appsflyer/internal/AFd1kSDK;

    .line 69
    .line 70
    iput-object p13, p0, Lcom/appsflyer/internal/AFg1eSDK;->copydefault:Lcom/appsflyer/internal/AFg1kSDK;

    .line 71
    .line 72
    iput-object p14, p0, Lcom/appsflyer/internal/AFg1eSDK;->equals:Lcom/appsflyer/internal/AFd1mSDK;

    .line 73
    .line 74
    sget-object p1, Lcom/appsflyer/internal/AFg1eSDK$2;->AFAdRevenueData:Lcom/appsflyer/internal/AFg1eSDK$2;

    .line 75
    .line 76
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lcom/appsflyer/internal/AFg1eSDK;->copy:Lkotlin/Lazy;

    .line 81
    .line 82
    sget-object p1, Lcom/appsflyer/internal/AFg1eSDK$1;->getMediationNetwork:Lcom/appsflyer/internal/AFg1eSDK$1;

    .line 83
    .line 84
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/appsflyer/internal/AFg1eSDK;->AFKeystoreWrapper:Lkotlin/Lazy;

    .line 89
    .line 90
    return-void
.end method

.method private static synthetic AFAdRevenueData([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    const/4 v0, 0x0

    aget-object p0, p0, v0

    check-cast p0, Lcom/appsflyer/internal/AFg1eSDK;

    .line 212
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v1, v1, 0x1d

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 v1, v1, 0x2

    const-string v2, "api_store_value"

    const v3, 0x6b2b3d12

    const v4, -0x6b2b3d0b

    if-nez v1, :cond_1

    .line 213
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v5

    invoke-static {v1, v4, v3, v5}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/appsflyer/AppsFlyerProperties;

    invoke-virtual {v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x40

    .line 214
    div-int/2addr v2, v0

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    return-object v1

    .line 215
    :cond_1
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0, v4, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/appsflyer/AppsFlyerProperties;

    invoke-virtual {v0, v2}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 216
    :goto_0
    const-string v0, "AF_STORE"

    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->getRevenue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x39

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    return-object p0

    :cond_2
    return-object v0
.end method

.method private final AFAdRevenueData()Ljava/text/SimpleDateFormat;
    .locals 2

    .line 180
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x3

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->AFKeystoreWrapper:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/text/SimpleDateFormat;

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method private AFAdRevenueData(Ljava/util/Map;Ljava/lang/String;)V
    .locals 7
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 196
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x77

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const-string v2, "prev_event_name"

    if-eqz v0, :cond_1

    .line 197
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 198
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    invoke-interface {v0, v2, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 199
    const-string v1, "prev_event_timestamp"

    if-eqz v0, :cond_0

    .line 200
    :try_start_1
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 201
    iget-object v4, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    const-wide/16 v5, -0x1

    invoke-interface {v4, v1, v5, v6}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-virtual {v3, v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 202
    invoke-virtual {v3, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 203
    const-string v0, "prev_event"

    invoke-interface {p1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 204
    sget p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p1, p1, 0x49

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 205
    :cond_0
    :try_start_2
    iget-object p1, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    invoke-interface {p1, v2, p2}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    invoke-interface {p0, v1, p1, p2}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-void

    .line 207
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 208
    :try_start_3
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    invoke-interface {p0, v2, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 209
    :try_start_4
    throw v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception p0

    .line 210
    throw p0

    :catch_0
    move-exception p0

    .line 211
    const-string p1, "Error while processing previous event."

    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private final AFInAppEventParameterName()Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "ro.appsflyer.preinstall.path"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork(Ljava/lang/String;)Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code(Ljava/io/File;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x77

    .line 20
    .line 21
    rem-int/lit16 v0, v0, 0x80

    .line 22
    .line 23
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 24
    .line 25
    const-string v0, "AF_PRE_INSTALL_PATH"

    .line 26
    .line 27
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->getRevenue(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork(Ljava/lang/String;)Ljava/io/File;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :cond_0
    invoke-static {v0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code(Ljava/io/File;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    const-string v0, "/data/local/tmp/pre_install.appsflyer"

    .line 42
    .line 43
    invoke-static {v0}, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork(Ljava/lang/String;)Ljava/io/File;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    :cond_1
    invoke-static {v0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code(Ljava/io/File;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 54
    .line 55
    add-int/lit8 v0, v0, 0x4b

    .line 56
    .line 57
    rem-int/lit16 v1, v0, 0x80

    .line 58
    .line 59
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 60
    .line 61
    rem-int/lit8 v0, v0, 0x2

    .line 62
    .line 63
    const-string v1, "/etc/pre_install.appsflyer"

    .line 64
    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    invoke-static {v1}, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork(Ljava/lang/String;)Ljava/io/File;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/16 v1, 0x30

    .line 72
    .line 73
    div-int/lit8 v1, v1, 0x0

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    invoke-static {v1}, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork(Ljava/lang/String;)Ljava/io/File;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    :cond_3
    :goto_0
    invoke-static {v0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code(Ljava/io/File;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_4

    .line 85
    .line 86
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 87
    .line 88
    add-int/lit8 p0, p0, 0x43

    .line 89
    .line 90
    rem-int/lit16 p0, p0, 0x80

    .line 91
    .line 92
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 93
    .line 94
    const/4 p0, 0x0

    .line 95
    return-object p0

    .line 96
    :cond_4
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 103
    .line 104
    .line 105
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 110
    .line 111
    .line 112
    move-result-wide v0

    .line 113
    long-to-int v0, v0

    .line 114
    const v1, -0x5421ec1a

    .line 115
    .line 116
    .line 117
    const v2, 0x5421ec1b

    .line 118
    .line 119
    .line 120
    invoke-static {p0, v1, v2, v0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    check-cast p0, Ljava/lang/String;

    .line 125
    .line 126
    return-object p0
.end method

.method private static AFInAppEventParameterName(Ljava/util/Map;)V
    .locals 2
    .param p0    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 127
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 128
    :try_start_0
    const-string v0, "lang"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x5f

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    goto :goto_0

    :catch_0
    move-exception v0

    .line 130
    const-string v1, "Exception while collecting display language name. "

    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 131
    :goto_0
    :try_start_1
    const-string v0, "lang_code"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 132
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x27

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    goto :goto_1

    :catch_1
    move-exception v0

    .line 133
    const-string v1, "Exception while collecting display language code. "

    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 134
    :goto_1
    :try_start_2
    const-string v0, "country"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 135
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p0, p0, 0x25

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_0

    return-void

    :cond_0
    const/4 p0, 0x0

    throw p0

    :catch_2
    move-exception p0

    .line 136
    const-string v0, "Exception while collecting country name. "

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private static AFInAppEventType(Ljava/util/Map;)V
    .locals 5
    .param p0    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_3

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/appsflyer/internal/AFb1gSDK;->getCurrencyIso4217Code()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Lcom/appsflyer/internal/AFb1gSDK;->getRevenue()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    sget v3, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 28
    .line 29
    add-int/lit8 v3, v3, 0x33

    .line 30
    .line 31
    rem-int/lit16 v4, v3, 0x80

    .line 32
    .line 33
    sput v4, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 34
    .line 35
    rem-int/lit8 v3, v3, 0x2

    .line 36
    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    add-int/lit8 v4, v4, 0x7b

    .line 42
    .line 43
    rem-int/lit16 v4, v4, 0x80

    .line 44
    .line 45
    sput v4, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 46
    .line 47
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-lez v1, :cond_0

    .line 52
    .line 53
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 54
    .line 55
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    rem-int/lit16 v1, v1, 0x80

    .line 58
    .line 59
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 60
    .line 61
    const-string v1, "reinstallCounter"

    .line 62
    .line 63
    invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    const-string v1, "originalAppsflyerId"

    .line 67
    .line 68
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void

    .line 72
    :cond_1
    throw v1

    .line 73
    :cond_2
    return-void

    .line 74
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    invoke-static {}, Lcom/appsflyer/internal/AFb1gSDK;->getCurrencyIso4217Code()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    invoke-static {}, Lcom/appsflyer/internal/AFb1gSDK;->getRevenue()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    throw v1
.end method

.method private AFKeystoreWrapper(Ljava/util/Map;)V
    .locals 1
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 84
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x2f

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 85
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 86
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->copydefault:Lcom/appsflyer/internal/AFg1kSDK;

    invoke-virtual {p0}, Lcom/appsflyer/internal/AFg1kSDK;->getMonetizationNetwork()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 87
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x53

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    return-void
.end method

.method private final AFKeystoreWrapper()Z
    .locals 5

    .line 1
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const v2, -0x6b2b3d0b

    .line 10
    .line 11
    .line 12
    const v3, 0x6b2b3d12

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/appsflyer/AppsFlyerProperties;

    .line 20
    .line 21
    const-string v1, "collectAndroidIdForceByUser"

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-virtual {v0, v1, v4}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 31
    .line 32
    add-int/lit8 v0, v0, 0x35

    .line 33
    .line 34
    rem-int/lit16 v0, v0, 0x80

    .line 35
    .line 36
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 37
    .line 38
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/appsflyer/AppsFlyerProperties;

    .line 51
    .line 52
    const-string v1, "collectIMEIForceByUser"

    .line 53
    .line 54
    invoke-virtual {v0, v1, v4}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFb1tSDK;

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork(Landroid/content/Context;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-nez p0, :cond_1

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    return v4

    .line 74
    :cond_2
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 75
    .line 76
    add-int/lit8 p0, p0, 0x25

    .line 77
    .line 78
    rem-int/lit16 p0, p0, 0x80

    .line 79
    .line 80
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 81
    .line 82
    :goto_1
    const/4 p0, 0x1

    .line 83
    return p0
.end method

.method private AFLogger(Ljava/util/Map;)V
    .locals 2
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1rSDK;->b_(Landroid/content/ContentResolver;)Lcom/appsflyer/internal/AFb1ySDK;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x49

    .line 19
    .line 20
    rem-int/lit16 v0, v0, 0x80

    .line 21
    .line 22
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 23
    .line 24
    const-string v0, "amazon_aid"

    .line 25
    .line 26
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1ySDK;->AFAdRevenueData:Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1ySDK;->getMediationNetwork:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v0, "amazon_aid_limit"

    .line 38
    .line 39
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 44
    .line 45
    add-int/lit8 p0, p0, 0x6b

    .line 46
    .line 47
    rem-int/lit16 p0, p0, 0x80

    .line 48
    .line 49
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 50
    .line 51
    return-void
.end method

.method private static a([IZLjava/lang/String;[Ljava/lang/Object;)V
    .locals 17

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->$10:I

    .line 4
    .line 5
    add-int/lit8 v1, v1, 0x5

    .line 6
    .line 7
    rem-int/lit16 v1, v1, 0x80

    .line 8
    .line 9
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->$11:I

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v1, "ISO-8859-1"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    check-cast v0, [B

    .line 20
    .line 21
    new-instance v1, Lcom/appsflyer/internal/AFk1xSDK;

    .line 22
    .line 23
    invoke-direct {v1}, Lcom/appsflyer/internal/AFk1xSDK;-><init>()V

    .line 24
    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    aget v3, p0, v2

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    aget v5, p0, v4

    .line 31
    .line 32
    const/4 v6, 0x2

    .line 33
    aget v7, p0, v6

    .line 34
    .line 35
    const/4 v8, 0x3

    .line 36
    aget v8, p0, v8

    .line 37
    .line 38
    sget-object v9, Lcom/appsflyer/internal/AFg1eSDK;->valueOf:[C

    .line 39
    .line 40
    if-eqz v9, :cond_2

    .line 41
    .line 42
    array-length v10, v9

    .line 43
    new-array v11, v10, [C

    .line 44
    .line 45
    move v12, v2

    .line 46
    :goto_0
    if-ge v12, v10, :cond_1

    .line 47
    .line 48
    aget-char v13, v9, v12

    .line 49
    .line 50
    int-to-long v13, v13

    .line 51
    const-wide v15, 0x175297e3d95c3522L    # 2.487366552316839E-196

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    xor-long/2addr v13, v15

    .line 57
    long-to-int v13, v13

    .line 58
    int-to-char v13, v13

    .line 59
    aput-char v13, v11, v12

    .line 60
    .line 61
    add-int/lit8 v12, v12, 0x1

    .line 62
    .line 63
    sget v13, Lcom/appsflyer/internal/AFg1eSDK;->$10:I

    .line 64
    .line 65
    add-int/lit8 v13, v13, 0x53

    .line 66
    .line 67
    rem-int/lit16 v13, v13, 0x80

    .line 68
    .line 69
    sput v13, Lcom/appsflyer/internal/AFg1eSDK;->$11:I

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    move-object v9, v11

    .line 73
    :cond_2
    new-array v10, v5, [C

    .line 74
    .line 75
    invoke-static {v9, v3, v10, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 76
    .line 77
    .line 78
    if-eqz v0, :cond_5

    .line 79
    .line 80
    sget v3, Lcom/appsflyer/internal/AFg1eSDK;->$10:I

    .line 81
    .line 82
    add-int/lit8 v3, v3, 0x35

    .line 83
    .line 84
    rem-int/lit16 v9, v3, 0x80

    .line 85
    .line 86
    sput v9, Lcom/appsflyer/internal/AFg1eSDK;->$11:I

    .line 87
    .line 88
    rem-int/2addr v3, v6

    .line 89
    new-array v3, v5, [C

    .line 90
    .line 91
    iput v2, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 92
    .line 93
    move v9, v2

    .line 94
    :goto_1
    iget v11, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 95
    .line 96
    if-ge v11, v5, :cond_4

    .line 97
    .line 98
    aget-byte v12, v0, v11

    .line 99
    .line 100
    if-ne v12, v4, :cond_3

    .line 101
    .line 102
    sget v12, Lcom/appsflyer/internal/AFg1eSDK;->$11:I

    .line 103
    .line 104
    add-int/lit8 v12, v12, 0x3b

    .line 105
    .line 106
    rem-int/lit16 v12, v12, 0x80

    .line 107
    .line 108
    sput v12, Lcom/appsflyer/internal/AFg1eSDK;->$10:I

    .line 109
    .line 110
    aget-char v12, v10, v11

    .line 111
    .line 112
    mul-int/2addr v12, v6

    .line 113
    add-int/2addr v12, v4

    .line 114
    sub-int/2addr v12, v9

    .line 115
    int-to-char v9, v12

    .line 116
    aput-char v9, v3, v11

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_3
    aget-char v12, v10, v11

    .line 120
    .line 121
    mul-int/2addr v12, v6

    .line 122
    sub-int/2addr v12, v9

    .line 123
    int-to-char v9, v12

    .line 124
    aput-char v9, v3, v11

    .line 125
    .line 126
    :goto_2
    aget-char v9, v3, v11

    .line 127
    .line 128
    add-int/lit8 v11, v11, 0x1

    .line 129
    .line 130
    iput v11, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_4
    move-object v10, v3

    .line 134
    :cond_5
    if-lez v8, :cond_6

    .line 135
    .line 136
    new-array v0, v5, [C

    .line 137
    .line 138
    invoke-static {v10, v2, v0, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 139
    .line 140
    .line 141
    sub-int v3, v5, v8

    .line 142
    .line 143
    invoke-static {v0, v2, v10, v3, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 144
    .line 145
    .line 146
    invoke-static {v0, v8, v10, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 147
    .line 148
    .line 149
    :cond_6
    if-eqz p1, :cond_8

    .line 150
    .line 151
    new-array v0, v5, [C

    .line 152
    .line 153
    iput v2, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 154
    .line 155
    sget v3, Lcom/appsflyer/internal/AFg1eSDK;->$11:I

    .line 156
    .line 157
    add-int/lit8 v3, v3, 0x15

    .line 158
    .line 159
    rem-int/lit16 v3, v3, 0x80

    .line 160
    .line 161
    sput v3, Lcom/appsflyer/internal/AFg1eSDK;->$10:I

    .line 162
    .line 163
    :goto_3
    iget v3, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 164
    .line 165
    if-ge v3, v5, :cond_7

    .line 166
    .line 167
    sget v8, Lcom/appsflyer/internal/AFg1eSDK;->$10:I

    .line 168
    .line 169
    add-int/lit8 v8, v8, 0x1d

    .line 170
    .line 171
    rem-int/lit16 v8, v8, 0x80

    .line 172
    .line 173
    sput v8, Lcom/appsflyer/internal/AFg1eSDK;->$11:I

    .line 174
    .line 175
    sub-int v8, v5, v3

    .line 176
    .line 177
    sub-int/2addr v8, v4

    .line 178
    aget-char v8, v10, v8

    .line 179
    .line 180
    aput-char v8, v0, v3

    .line 181
    .line 182
    add-int/lit8 v3, v3, 0x1

    .line 183
    .line 184
    iput v3, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 185
    .line 186
    goto :goto_3

    .line 187
    :cond_7
    move-object v10, v0

    .line 188
    :cond_8
    if-lez v7, :cond_9

    .line 189
    .line 190
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->$11:I

    .line 191
    .line 192
    add-int/lit8 v0, v0, 0x77

    .line 193
    .line 194
    rem-int/lit16 v0, v0, 0x80

    .line 195
    .line 196
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->$10:I

    .line 197
    .line 198
    iput v2, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 199
    .line 200
    :goto_4
    iget v0, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 201
    .line 202
    if-ge v0, v5, :cond_9

    .line 203
    .line 204
    aget-char v3, v10, v0

    .line 205
    .line 206
    aget v4, p0, v6

    .line 207
    .line 208
    sub-int/2addr v3, v4

    .line 209
    int-to-char v3, v3

    .line 210
    aput-char v3, v10, v0

    .line 211
    .line 212
    add-int/lit8 v0, v0, 0x1

    .line 213
    .line 214
    iput v0, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 215
    .line 216
    goto :goto_4

    .line 217
    :cond_9
    new-instance v0, Ljava/lang/String;

    .line 218
    .line 219
    invoke-direct {v0, v10}, Ljava/lang/String;-><init>([C)V

    .line 220
    .line 221
    .line 222
    aput-object v0, p3, v2

    .line 223
    .line 224
    return-void
.end method

.method private static synthetic areAllFieldsValid([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 123
    new-instance p0, Landroid/os/StatFs;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 124
    invoke-virtual {p0}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v0

    .line 125
    invoke-virtual {p0}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v2

    mul-long/2addr v2, v0

    .line 126
    invoke-virtual {p0}, Landroid/os/StatFs;->getBlockCountLong()J

    move-result-wide v4

    mul-long/2addr v4, v0

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    const-wide/high16 v6, 0x4034000000000000L    # 20.0

    .line 127
    invoke-static {v0, v1, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    long-to-double v2, v2

    div-double/2addr v2, v0

    double-to-long v2, v2

    long-to-double v4, v4

    div-double/2addr v4, v0

    double-to-long v0, v4

    .line 128
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 v2, 0x2f

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x57

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method private static areAllFieldsValid()Ljava/lang/String;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const/4 v0, 0x0

    .line 129
    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    long-to-int v1, v1

    const v2, -0x72865da8

    const v3, 0x72865db2

    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method private final areAllFieldsValid(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x47

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const v2, 0x6b2b3d12

    .line 13
    .line 14
    .line 15
    const v3, -0x6b2b3d0b

    .line 16
    .line 17
    .line 18
    if-eqz v0, :cond_3

    .line 19
    .line 20
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    invoke-static {v0, v3, v2, v4}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/appsflyer/AppsFlyerProperties;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/appsflyer/AppsFlyerProperties;->isOtherSdkStringDisabled()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 41
    .line 42
    add-int/lit8 v0, v0, 0x5

    .line 43
    .line 44
    rem-int/lit16 v2, v0, 0x80

    .line 45
    .line 46
    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 47
    .line 48
    rem-int/lit8 v0, v0, 0x2

    .line 49
    .line 50
    iget-object v2, p0, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1vSDK;

    .line 51
    .line 52
    const-string v3, "batteryLevel"

    .line 53
    .line 54
    if-nez v0, :cond_0

    .line 55
    .line 56
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 57
    .line 58
    invoke-interface {v2, p0}, Lcom/appsflyer/internal/AFd1vSDK;->getMonetizationNetwork(Landroid/content/Context;)Lcom/appsflyer/internal/AFd1vSDK$AFa1ySDK;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    iget p0, p0, Lcom/appsflyer/internal/AFd1vSDK$AFa1ySDK;->getMonetizationNetwork:F

    .line 63
    .line 64
    invoke-static {p0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    const/16 p0, 0xf

    .line 72
    .line 73
    div-int/lit8 p0, p0, 0x0

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 77
    .line 78
    invoke-interface {v2, p0}, Lcom/appsflyer/internal/AFd1vSDK;->getMonetizationNetwork(Landroid/content/Context;)Lcom/appsflyer/internal/AFd1vSDK$AFa1ySDK;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    iget p0, p0, Lcom/appsflyer/internal/AFd1vSDK$AFa1ySDK;->getMonetizationNetwork:F

    .line 83
    .line 84
    invoke-static {p0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    :cond_1
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 92
    .line 93
    add-int/lit8 p0, p0, 0x79

    .line 94
    .line 95
    rem-int/lit16 p1, p0, 0x80

    .line 96
    .line 97
    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 98
    .line 99
    rem-int/lit8 p0, p0, 0x2

    .line 100
    .line 101
    if-eqz p0, :cond_2

    .line 102
    .line 103
    return-void

    .line 104
    :cond_2
    throw v1

    .line 105
    :cond_3
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    invoke-static {p1, v3, v2, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    check-cast p0, Lcom/appsflyer/AppsFlyerProperties;

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerProperties;->isOtherSdkStringDisabled()Z

    .line 120
    .line 121
    .line 122
    throw v1
.end method

.method private static synthetic component1([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p0, p0, v0

    .line 3
    .line 4
    check-cast p0, Lcom/appsflyer/internal/AFg1eSDK;

    .line 5
    .line 6
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 7
    .line 8
    add-int/lit8 v1, v1, 0x75

    .line 9
    .line 10
    rem-int/lit16 v2, v1, 0x80

    .line 11
    .line 12
    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 13
    .line 14
    rem-int/lit8 v1, v1, 0x2

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {v1, p0}, Lcom/appsflyer/internal/AFb1vSDK;->e_(Landroid/content/pm/PackageManager;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const/16 v1, 0x16

    .line 43
    .line 44
    div-int/2addr v1, v0

    .line 45
    return-object p0

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {v0, p0}, Lcom/appsflyer/internal/AFb1vSDK;->e_(Landroid/content/pm/PackageManager;Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method private component1()Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 78
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v1, -0x5ffa023b

    const v2, 0x5ffa023b

    invoke-static {v0, v1, v2, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private final component1(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 71
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x19

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 72
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1vSDK;

    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    invoke-interface {v0, p0}, Lcom/appsflyer/internal/AFd1vSDK;->getMonetizationNetwork(Landroid/content/Context;)Lcom/appsflyer/internal/AFd1vSDK$AFa1ySDK;

    move-result-object p0

    .line 73
    iget v0, p0, Lcom/appsflyer/internal/AFd1vSDK$AFa1ySDK;->getMonetizationNetwork:F

    .line 74
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1vSDK$AFa1ySDK;->AFAdRevenueData:Ljava/lang/String;

    .line 75
    const-string v1, "btl"

    invoke-static {v0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p0, :cond_0

    .line 76
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v0, v0, 0x57

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 77
    const-string v0, "btch"

    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private static synthetic component2([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p0, v0

    .line 3
    .line 4
    check-cast v1, Lcom/appsflyer/internal/AFg1eSDK;

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    aget-object p0, p0, v2

    .line 8
    .line 9
    check-cast p0, Ljava/lang/String;

    .line 10
    .line 11
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const v4, -0x6b2b3d0b

    .line 20
    .line 21
    .line 22
    const v5, 0x6b2b3d12

    .line 23
    .line 24
    .line 25
    invoke-static {v2, v4, v5, v3}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/appsflyer/AppsFlyerProperties;

    .line 30
    .line 31
    const-string v3, "collectAndroidId"

    .line 32
    .line 33
    invoke-virtual {v2, v3, v0}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v2, 0x0

    .line 38
    if-eqz v0, :cond_4

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 43
    .line 44
    add-int/lit8 v0, v0, 0x17

    .line 45
    .line 46
    rem-int/lit16 v3, v0, 0x80

    .line 47
    .line 48
    sput v3, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 49
    .line 50
    rem-int/lit8 v0, v0, 0x2

    .line 51
    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_4

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 62
    .line 63
    .line 64
    throw v2

    .line 65
    :cond_1
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 66
    .line 67
    add-int/lit8 p0, p0, 0x19

    .line 68
    .line 69
    rem-int/lit16 v0, p0, 0x80

    .line 70
    .line 71
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 72
    .line 73
    rem-int/lit8 p0, p0, 0x2

    .line 74
    .line 75
    if-nez p0, :cond_3

    .line 76
    .line 77
    invoke-direct {v1}, Lcom/appsflyer/internal/AFg1eSDK;->AFKeystoreWrapper()Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_2

    .line 82
    .line 83
    invoke-direct {v1}, Lcom/appsflyer/internal/AFg1eSDK;->copy()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0

    .line 88
    :cond_2
    return-object v2

    .line 89
    :cond_3
    invoke-direct {v1}, Lcom/appsflyer/internal/AFg1eSDK;->AFKeystoreWrapper()Z

    .line 90
    .line 91
    .line 92
    throw v2

    .line 93
    :cond_4
    if-eqz p0, :cond_5

    .line 94
    .line 95
    return-object p0

    .line 96
    :cond_5
    return-object v2
.end method

.method private component2()Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 97
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v1, 0x71d74625

    const v2, -0x71d7461a

    invoke-static {v0, v1, v2, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private component2(Ljava/util/Map;)V
    .locals 2
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 98
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v0, -0xdb8f20c

    const v1, 0xdb8f218

    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method private static component3()J
    .locals 4

    .line 92
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x9

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    sget v2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v2, v2, 0x77

    rem-int/lit16 v2, v2, 0x80

    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    return-wide v0
.end method

.method private static component3(Ljava/util/Map;)V
    .locals 4
    .param p0    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x3f

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    const/16 v0, 0xb5

    .line 13
    .line 14
    const/4 v1, 0x3

    .line 15
    const/16 v2, 0xf

    .line 16
    .line 17
    const/4 v3, 0x5

    .line 18
    filled-new-array {v2, v3, v0, v1}, [I

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x1

    .line 23
    new-array v2, v1, [Ljava/lang/Object;

    .line 24
    .line 25
    const-string v3, "\u0000\u0001\u0000\u0000\u0000"

    .line 26
    .line 27
    invoke-static {v0, v1, v3, v2}, Lcom/appsflyer/internal/AFg1eSDK;->a([IZLjava/lang/String;[Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    aget-object v0, v2, v0

    .line 32
    .line 33
    check-cast v0, Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 40
    .line 41
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    const-string v0, "device"

    .line 45
    .line 46
    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    .line 47
    .line 48
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    const-string v0, "product"

    .line 52
    .line 53
    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 54
    .line 55
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 59
    .line 60
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, "sdk"

    .line 65
    .line 66
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    const-string v0, "model"

    .line 70
    .line 71
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 72
    .line 73
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    const-string v0, "deviceType"

    .line 77
    .line 78
    sget-object v1, Landroid/os/Build;->TYPE:Ljava/lang/String;

    .line 79
    .line 80
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 84
    .line 85
    add-int/lit8 p0, p0, 0x39

    .line 86
    .line 87
    rem-int/lit16 p0, p0, 0x80

    .line 88
    .line 89
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 90
    .line 91
    return-void
.end method

.method private static synthetic component4([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    const/4 v0, 0x0

    aget-object p0, p0, v0

    check-cast p0, Lcom/appsflyer/internal/AFg1eSDK;

    .line 40
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x2f

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->copy:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/AppsFlyerProperties;

    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x53

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method private component4(Ljava/util/Map;)V
    .locals 2
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 41
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v0, 0x79c8532e

    const v1, -0x79c85326

    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method private component4()Z
    .locals 3

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x79

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const-string v2, "appsFlyerCount"

    .line 15
    .line 16
    invoke-interface {p0, v2}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x7

    .line 23
    div-int/2addr v0, v1

    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    if-nez p0, :cond_1

    .line 28
    .line 29
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 30
    .line 31
    add-int/lit8 p0, p0, 0xb

    .line 32
    .line 33
    rem-int/lit16 p0, p0, 0x80

    .line 34
    .line 35
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    return v1
.end method

.method private final copy()Ljava/lang/String;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HardwareIds"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 2
    .line 3
    const-string v1, "androidIdCached"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-interface {v0, v1, v2}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :try_start_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v1, "android_id"

    .line 17
    .line 18
    invoke-static {p0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1b

    .line 27
    .line 28
    rem-int/lit16 v0, v0, 0x80

    .line 29
    .line 30
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 31
    .line 32
    return-object p0

    .line 33
    :catch_0
    move-exception p0

    .line 34
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    if-eqz v0, :cond_2

    .line 42
    .line 43
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 44
    .line 45
    add-int/lit8 p0, p0, 0x35

    .line 46
    .line 47
    rem-int/lit16 v1, p0, 0x80

    .line 48
    .line 49
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 50
    .line 51
    rem-int/lit8 p0, p0, 0x2

    .line 52
    .line 53
    const-string v1, "use cached AndroidId: "

    .line 54
    .line 55
    if-nez p0, :cond_1

    .line 56
    .line 57
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-object v0

    .line 69
    :cond_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    throw v2

    .line 81
    :cond_2
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 82
    .line 83
    add-int/lit8 p0, p0, 0x39

    .line 84
    .line 85
    rem-int/lit16 v0, p0, 0x80

    .line 86
    .line 87
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 88
    .line 89
    rem-int/lit8 p0, p0, 0x2

    .line 90
    .line 91
    if-nez p0, :cond_3

    .line 92
    .line 93
    return-object v2

    .line 94
    :cond_3
    throw v2
.end method

.method private copy(Ljava/util/Map;)V
    .locals 4
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 95
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x7d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const-string v2, "is_pc"

    const-string v3, "com.google.android.play.feature.HPE_EXPERIENCE"

    if-eqz v0, :cond_1

    .line 96
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 97
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    .line 98
    invoke-virtual {p0, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    .line 99
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    .line 100
    invoke-interface {p1, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x21

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    return-void

    :cond_0
    throw v1

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 102
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    .line 103
    invoke-virtual {p0, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    .line 104
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    .line 105
    invoke-interface {p1, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    throw v1
.end method

.method private final copydefault(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x43

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 8
    .line 9
    add-int/lit8 v0, v0, 0x57

    .line 10
    .line 11
    rem-int/lit16 v1, v0, 0x80

    .line 12
    .line 13
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 14
    .line 15
    rem-int/lit8 v0, v0, 0x2

    .line 16
    .line 17
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 18
    .line 19
    const-class v1, Landroid/app/UiModeManager;

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Landroid/app/UiModeManager;

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/app/UiModeManager;->getCurrentModeType()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/4 v0, 0x4

    .line 36
    if-ne p0, v0, :cond_0

    .line 37
    .line 38
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 39
    .line 40
    add-int/lit8 p0, p0, 0x3

    .line 41
    .line 42
    rem-int/lit16 p0, p0, 0x80

    .line 43
    .line 44
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 45
    .line 46
    const-string p0, "tv"

    .line 47
    .line 48
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    :cond_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 54
    .line 55
    add-int/lit8 p0, p0, 0x65

    .line 56
    .line 57
    rem-int/lit16 p1, p0, 0x80

    .line 58
    .line 59
    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 60
    .line 61
    rem-int/lit8 p0, p0, 0x2

    .line 62
    .line 63
    if-eqz p0, :cond_1

    .line 64
    .line 65
    const/16 p0, 0x45

    .line 66
    .line 67
    div-int/lit8 p0, p0, 0x0

    .line 68
    .line 69
    :cond_1
    return-void

    .line 70
    :cond_2
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    check-cast p0, Landroid/app/UiModeManager;

    .line 75
    .line 76
    const/4 p0, 0x0

    .line 77
    throw p0
.end method

.method private copydefault()Z
    .locals 2

    .line 78
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x73

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    const-string v0, "sentSuccessfully"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p0

    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v0, v0, 0x6f

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    return p0
.end method

.method private d(Ljava/util/Map;)V
    .locals 2
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const v0, -0x78383984

    .line 10
    .line 11
    .line 12
    const v1, 0x78383989

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private e(Ljava/util/Map;)V
    .locals 2
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x4b

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    const-string v1, "is_stop_tracking_used"

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 27
    .line 28
    invoke-interface {p0, v1}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    const-string v0, "istu"

    .line 33
    .line 34
    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 42
    .line 43
    add-int/lit8 p0, p0, 0x1b

    .line 44
    .line 45
    rem-int/lit16 p0, p0, 0x80

    .line 46
    .line 47
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 48
    .line 49
    :cond_0
    return-void

    .line 50
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 54
    .line 55
    invoke-interface {p0, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    const/4 p0, 0x0

    .line 59
    throw p0
.end method

.method private equals()Ljava/lang/String;
    .locals 6
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x6f

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const v2, 0x6b2b3d12

    .line 13
    .line 14
    .line 15
    const v3, -0x6b2b3d0b

    .line 16
    .line 17
    .line 18
    const-string v4, "preInstallName"

    .line 19
    .line 20
    if-nez v0, :cond_6

    .line 21
    .line 22
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    invoke-static {v0, v3, v2, v5}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/appsflyer/AppsFlyerProperties;

    .line 35
    .line 36
    invoke-virtual {v0, v4}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    return-object v0

    .line 43
    :cond_0
    iget-object v5, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 44
    .line 45
    invoke-interface {v5, v4}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    if-eqz v5, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 52
    .line 53
    invoke-interface {v0, v4, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 58
    .line 59
    add-int/lit8 v1, v1, 0x7

    .line 60
    .line 61
    rem-int/lit16 v1, v1, 0x80

    .line 62
    .line 63
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    invoke-direct {p0}, Lcom/appsflyer/internal/AFg1eSDK;->component4()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    invoke-direct {p0}, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventParameterName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    if-nez v0, :cond_2

    .line 77
    .line 78
    const-string v0, "AF_PRE_INSTALL_NAME"

    .line 79
    .line 80
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->getRevenue(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    :cond_2
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 85
    .line 86
    add-int/lit8 v1, v1, 0x13

    .line 87
    .line 88
    rem-int/lit16 v1, v1, 0x80

    .line 89
    .line 90
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 91
    .line 92
    :cond_3
    if-eqz v0, :cond_4

    .line 93
    .line 94
    iget-object v1, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 95
    .line 96
    invoke-interface {v1, v4, v0}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 100
    .line 101
    add-int/lit8 v1, v1, 0x55

    .line 102
    .line 103
    rem-int/lit16 v1, v1, 0x80

    .line 104
    .line 105
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 106
    .line 107
    :cond_4
    :goto_0
    if-eqz v0, :cond_5

    .line 108
    .line 109
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 110
    .line 111
    add-int/lit8 v1, v1, 0x3

    .line 112
    .line 113
    rem-int/lit16 v1, v1, 0x80

    .line 114
    .line 115
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 116
    .line 117
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    invoke-static {v1, v3, v2, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    check-cast p0, Lcom/appsflyer/AppsFlyerProperties;

    .line 130
    .line 131
    invoke-virtual {p0, v4, v0}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_5
    return-object v0

    .line 135
    :cond_6
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    invoke-static {v0, v3, v2, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    check-cast p0, Lcom/appsflyer/AppsFlyerProperties;

    .line 148
    .line 149
    invoke-virtual {p0, v4}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    throw v1
.end method

.method private equals(Ljava/util/Map;)V
    .locals 8
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 153
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 154
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    const-string v1, "AppsFlyerTimePassedSincePrevLaunch"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;J)J

    move-result-wide v4

    .line 155
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 156
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    invoke-interface {p0, v1, v6, v7}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;J)V

    cmp-long p0, v4, v2

    if-lez p0, :cond_0

    .line 157
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x61

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    const-wide/16 v1, 0x3e8

    sub-long/2addr v6, v4

    .line 158
    div-long/2addr v6, v1

    add-int/lit8 v0, v0, 0x49

    .line 159
    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    goto :goto_0

    :cond_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x4d

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    const-wide/16 v6, -0x1

    .line 160
    :goto_0
    const-string p0, "timepassedsincelastlaunch"

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static synthetic getCurrencyIso4217Code([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    const/4 v0, 0x0

    aget-object v0, p0, v0

    check-cast v0, Lcom/appsflyer/internal/AFg1eSDK;

    const/4 v1, 0x1

    aget-object v1, p0, v1

    check-cast v1, Ljava/util/Map;

    const/4 v2, 0x2

    aget-object p0, p0, v2

    check-cast p0, Ljava/lang/String;

    .line 430
    sget v3, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v3, v3, 0x67

    rem-int/lit16 v3, v3, 0x80

    sput v3, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 431
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 432
    const-string v3, "referrer"

    if-eqz p0, :cond_1

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-nez v4, :cond_0

    goto :goto_0

    .line 433
    :cond_0
    invoke-interface {v1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 434
    :cond_1
    :goto_0
    iget-object p0, v0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    const-string v4, "extraReferrers"

    const/4 v5, 0x0

    invoke-interface {p0, v4, v5}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 435
    invoke-interface {v1, v4, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 436
    :cond_2
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v4

    const v6, -0x6b2b3d0b

    const v7, 0x6b2b3d12

    invoke-static {p0, v6, v7, v4}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/AppsFlyerProperties;

    iget-object v0, v0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    invoke-virtual {p0, v0}, Lcom/appsflyer/AppsFlyerProperties;->getReferrer(Lcom/appsflyer/internal/AFd1rSDK;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_6

    .line 437
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_3

    goto :goto_1

    .line 438
    :cond_3
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x49

    rem-int/lit16 v4, v0, 0x80

    sput v4, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/2addr v0, v2

    if-eqz v0, :cond_5

    .line 439
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_6

    .line 440
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v0, v0, 0x29

    rem-int/lit16 v4, v0, 0x80

    sput v4, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    rem-int/2addr v0, v2

    if-nez v0, :cond_4

    .line 441
    invoke-interface {v1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_4
    invoke-interface {v1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 442
    throw v5

    :cond_5
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    throw v5

    :cond_6
    :goto_1
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x4d

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    return-object v5
.end method

.method public static synthetic getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;
    .locals 3

    .line 1
    mul-int/lit16 v0, p1, 0x132

    .line 2
    .line 3
    add-int/lit16 v0, v0, 0x262

    .line 4
    .line 5
    mul-int/lit16 v1, p2, 0x132

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    or-int v1, p1, p2

    .line 9
    .line 10
    not-int v1, v1

    .line 11
    or-int v2, p1, p3

    .line 12
    .line 13
    not-int v2, v2

    .line 14
    or-int/2addr v1, v2

    .line 15
    mul-int/lit16 v1, v1, 0x131

    .line 16
    .line 17
    add-int/2addr v0, v1

    .line 18
    not-int p2, p2

    .line 19
    not-int p3, p3

    .line 20
    or-int/2addr p1, p3

    .line 21
    not-int p1, p1

    .line 22
    or-int/2addr p1, p2

    .line 23
    mul-int/lit16 p1, p1, 0x131

    .line 24
    .line 25
    add-int/2addr v0, p1

    .line 26
    const/4 p1, 0x1

    .line 27
    const/4 p2, 0x0

    .line 28
    const/4 p3, 0x0

    .line 29
    packed-switch v0, :pswitch_data_0

    .line 30
    .line 31
    .line 32
    invoke-static {p0}, Lcom/appsflyer/internal/AFg1eSDK;->AFAdRevenueData([Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :pswitch_0
    aget-object p2, p0, p2

    .line 38
    .line 39
    check-cast p2, Lcom/appsflyer/internal/AFg1eSDK;

    .line 40
    .line 41
    aget-object p0, p0, p1

    .line 42
    .line 43
    check-cast p0, Ljava/util/Map;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p2}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const v1, -0x6b2b3d0b

    .line 57
    .line 58
    .line 59
    const v2, 0x6b2b3d12

    .line 60
    .line 61
    .line 62
    invoke-static {p1, v1, v2, v0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/appsflyer/AppsFlyerProperties;

    .line 67
    .line 68
    const-string v0, "oneLinkSlug"

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {p2}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    invoke-static {v0, v1, v2, p2}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    check-cast p2, Lcom/appsflyer/AppsFlyerProperties;

    .line 87
    .line 88
    const-string v0, "onelinkVersion"

    .line 89
    .line 90
    invoke-virtual {p2, v0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    if-eqz p1, :cond_0

    .line 95
    .line 96
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 97
    .line 98
    add-int/lit8 v0, v0, 0x47

    .line 99
    .line 100
    rem-int/lit16 v0, v0, 0x80

    .line 101
    .line 102
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 103
    .line 104
    const-string v0, "onelink_id"

    .line 105
    .line 106
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    sget p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 110
    .line 111
    add-int/lit8 p1, p1, 0x17

    .line 112
    .line 113
    rem-int/lit16 p1, p1, 0x80

    .line 114
    .line 115
    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 116
    .line 117
    :cond_0
    if-eqz p2, :cond_1

    .line 118
    .line 119
    const-string p1, "onelink_ver"

    .line 120
    .line 121
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 125
    .line 126
    add-int/lit8 p0, p0, 0x53

    .line 127
    .line 128
    rem-int/lit16 p0, p0, 0x80

    .line 129
    .line 130
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 131
    .line 132
    :cond_1
    return-object p3

    .line 133
    :pswitch_1
    aget-object p0, p0, p2

    .line 134
    .line 135
    check-cast p0, Lcom/appsflyer/internal/AFg1eSDK;

    .line 136
    .line 137
    sget p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 138
    .line 139
    add-int/lit8 p1, p1, 0x3d

    .line 140
    .line 141
    rem-int/lit16 p1, p1, 0x80

    .line 142
    .line 143
    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 144
    .line 145
    iget-object p1, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 146
    .line 147
    const-string p2, "INSTALL_STORE"

    .line 148
    .line 149
    invoke-interface {p1, p2}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-eqz p1, :cond_2

    .line 154
    .line 155
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 156
    .line 157
    invoke-interface {p0, p2, p3}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    return-object p0

    .line 162
    :cond_2
    invoke-direct {p0}, Lcom/appsflyer/internal/AFg1eSDK;->component4()Z

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    if-eqz p1, :cond_3

    .line 167
    .line 168
    sget p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 169
    .line 170
    add-int/lit8 p1, p1, 0x15

    .line 171
    .line 172
    rem-int/lit16 p1, p1, 0x80

    .line 173
    .line 174
    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 175
    .line 176
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 181
    .line 182
    .line 183
    move-result p3

    .line 184
    const v0, -0x5ffa023b

    .line 185
    .line 186
    .line 187
    const v1, 0x5ffa023b

    .line 188
    .line 189
    .line 190
    invoke-static {p1, v0, v1, p3}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    move-object p3, p1

    .line 195
    check-cast p3, Ljava/lang/String;

    .line 196
    .line 197
    :cond_3
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 198
    .line 199
    invoke-interface {p0, p2, p3}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    return-object p3

    .line 203
    :pswitch_2
    invoke-static {p0}, Lcom/appsflyer/internal/AFg1eSDK;->areAllFieldsValid([Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    return-object p0

    .line 208
    :pswitch_3
    invoke-static {p0}, Lcom/appsflyer/internal/AFg1eSDK;->component2([Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    return-object p0

    .line 213
    :pswitch_4
    aget-object p2, p0, p2

    .line 214
    .line 215
    check-cast p2, Lcom/appsflyer/internal/AFg1eSDK;

    .line 216
    .line 217
    aget-object p0, p0, p1

    .line 218
    .line 219
    check-cast p0, Ljava/util/Map;

    .line 220
    .line 221
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 222
    .line 223
    .line 224
    iget-object p1, p2, Lcom/appsflyer/internal/AFg1eSDK;->component2:Lcom/appsflyer/internal/AFh1qSDK;

    .line 225
    .line 226
    new-instance v0, Ljava/util/HashMap;

    .line 227
    .line 228
    iget-object v1, p1, Lcom/appsflyer/internal/AFh1qSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 229
    .line 230
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 231
    .line 232
    .line 233
    iget-object p1, p1, Lcom/appsflyer/internal/AFh1qSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 234
    .line 235
    invoke-interface {p1}, Ljava/util/Map;->clear()V

    .line 236
    .line 237
    .line 238
    iget-object p1, p2, Lcom/appsflyer/internal/AFg1eSDK;->component2:Lcom/appsflyer/internal/AFh1qSDK;

    .line 239
    .line 240
    iget-object p1, p1, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1rSDK;

    .line 241
    .line 242
    const-string p2, "gcd"

    .line 243
    .line 244
    invoke-interface {p1, p2}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    if-nez p1, :cond_4

    .line 252
    .line 253
    sget p1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 254
    .line 255
    add-int/lit8 p1, p1, 0x4f

    .line 256
    .line 257
    rem-int/lit16 p1, p1, 0x80

    .line 258
    .line 259
    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 260
    .line 261
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/util/Map;)Ljava/util/Map;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 266
    .line 267
    .line 268
    invoke-interface {p0, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    :cond_4
    return-object p3

    .line 272
    :pswitch_5
    invoke-static {p0}, Lcom/appsflyer/internal/AFg1eSDK;->component4([Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    return-object p0

    .line 277
    :pswitch_6
    invoke-static {p0}, Lcom/appsflyer/internal/AFg1eSDK;->component1([Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    return-object p0

    .line 282
    :pswitch_7
    aget-object p2, p0, p2

    .line 283
    .line 284
    check-cast p2, Lcom/appsflyer/internal/AFg1eSDK;

    .line 285
    .line 286
    aget-object p0, p0, p1

    .line 287
    .line 288
    check-cast p0, Ljava/util/Map;

    .line 289
    .line 290
    sget p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 291
    .line 292
    add-int/lit8 p1, p1, 0x35

    .line 293
    .line 294
    rem-int/lit16 p1, p1, 0x80

    .line 295
    .line 296
    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 297
    .line 298
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 299
    .line 300
    .line 301
    iget-object p1, p2, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 302
    .line 303
    invoke-static {p1}, Lcom/appsflyer/internal/AFg1lSDK;->getMediationNetwork(Landroid/content/Context;)Z

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    const-string v0, "didConfigureTokenRefreshService="

    .line 308
    .line 309
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    if-nez p1, :cond_5

    .line 321
    .line 322
    sget p1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 323
    .line 324
    add-int/lit8 p1, p1, 0x33

    .line 325
    .line 326
    rem-int/lit16 p1, p1, 0x80

    .line 327
    .line 328
    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 329
    .line 330
    const-string p1, "tokenRefreshConfigured"

    .line 331
    .line 332
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 333
    .line 334
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    .line 336
    .line 337
    :cond_5
    iget-object p1, p2, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 338
    .line 339
    invoke-static {p1}, Lcom/appsflyer/internal/AFg1lSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFd1rSDK;)Z

    .line 340
    .line 341
    .line 342
    move-result p1

    .line 343
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    const-string p2, "registeredUninstall"

    .line 348
    .line 349
    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    return-object p3

    .line 353
    :pswitch_8
    invoke-static {p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    .line 355
    .line 356
    move-result-object p0

    .line 357
    return-object p0

    .line 358
    :pswitch_9
    invoke-static {p0}, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork([Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object p0

    .line 362
    return-object p0

    .line 363
    :pswitch_a
    invoke-static {p0}, Lcom/appsflyer/internal/AFg1eSDK;->getRevenue([Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    .line 365
    .line 366
    move-result-object p0

    .line 367
    return-object p0

    .line 368
    :pswitch_b
    invoke-static {p0}, Lcom/appsflyer/internal/AFg1eSDK;->getMediationNetwork([Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    .line 370
    .line 371
    move-result-object p0

    .line 372
    return-object p0

    .line 373
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getCurrencyIso4217Code()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;,
            Ljava/security/NoSuchAlgorithmException;,
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 474
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v1, -0x225672f9

    const v2, 0x225672ff

    invoke-static {v0, v1, v2, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private static getCurrencyIso4217Code(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 473
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-int p1, v0

    const v0, -0x5421ec1a

    const v1, 0x5421ec1b

    invoke-static {p0, v0, v1, p1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private static getCurrencyIso4217Code(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 457
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x2f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    const-class v1, Ljava/lang/String;

    const-string v2, "get"

    const-string v3, "android.os.SystemProperties"

    const/4 v4, 0x0

    if-nez v0, :cond_0

    .line 458
    :try_start_0
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v3, 0x0

    .line 459
    new-array v5, v3, [Ljava/lang/Class;

    const/4 v6, 0x1

    aput-object v1, v5, v6

    invoke-virtual {v0, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 460
    new-array v1, v3, [Ljava/lang/Object;

    aput-object p0, v1, v6

    invoke-virtual {v0, v4, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_1

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 461
    :cond_0
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 462
    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 463
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v4, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 464
    :goto_0
    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 465
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v0, v0, 0x37

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    return-object p0

    .line 466
    :cond_1
    :try_start_1
    new-instance p0, Ljava/lang/NullPointerException;

    const-string v0, "null cannot be cast to non-null type kotlin.String"

    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 467
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v4
.end method

.method private static getCurrencyIso4217Code(Ljava/util/Map;Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 2
    .param p0    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lcom/appsflyer/internal/AFa1mSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/appsflyer/internal/AFa1mSDK;",
            ")V"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 469
    iget-object v0, p1, Lcom/appsflyer/internal/AFa1mSDK;->component4:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 470
    const-string v1, "eventName"

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    new-instance v0, Lorg/json/JSONObject;

    iget-object p1, p1, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork:Ljava/util/Map;

    if-nez p1, :cond_0

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    :cond_0
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    .line 472
    const-string v0, "eventValue"

    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method private getCurrencyIso4217Code(Ljava/util/Map;Lkotlin/jvm/functions/Function0;)V
    .locals 8
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 443
    const-string v0, "Exception while collecting facebook\'s attribution ID. "

    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v1, v1, 0x7b

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v2, 0x1

    const-string v3, "collectFacebookAttrId"

    const v4, 0x6b2b3d12

    const v5, -0x6b2b3d0b

    const/4 v6, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 444
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v7

    invoke-static {v1, v5, v4, v7}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/appsflyer/AppsFlyerProperties;

    invoke-virtual {v1, v3, v6}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    return-void

    .line 445
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 446
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v7

    invoke-static {v1, v5, v4, v7}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/appsflyer/AppsFlyerProperties;

    invoke-virtual {v1, v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_3

    :goto_0
    const/4 v1, 0x0

    .line 447
    :try_start_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v3, "com.facebook.katana"

    invoke-virtual {p0, v3, v6}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 448
    invoke-interface {p2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 449
    sget p2, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p2, p2, 0x5d

    rem-int/lit16 p2, p2, 0x80

    sput p2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    move-object v1, p0

    goto :goto_3

    :catchall_0
    move-exception p0

    goto :goto_1

    :catch_0
    move-exception p0

    goto :goto_2

    .line 450
    :goto_1
    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 451
    :goto_2
    const-string p2, "com.facebook.katana not found"

    invoke-static {p2, p0, v2}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;Z)V

    .line 452
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    :goto_3
    if-eqz v1, :cond_3

    .line 453
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p0, p0, 0x75

    rem-int/lit16 p2, p0, 0x80

    sput p2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    rem-int/lit8 p0, p0, 0x2

    const-string p2, "fb"

    if-eqz p0, :cond_2

    .line 454
    invoke-interface {p1, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 p0, 0xc

    .line 455
    div-int/2addr p0, v6

    goto :goto_4

    .line 456
    :cond_2
    invoke-interface {p1, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    :goto_4
    return-void
.end method

.method private getCurrencyIso4217Code(Ljava/util/Map;Z)V
    .locals 2
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z)V"
        }
    .end annotation

    .line 412
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x27

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 413
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 414
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->hashCode:Lcom/appsflyer/internal/AFb1aSDK;

    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1aSDK;->AFAdRevenueData()Ljava/lang/String;

    move-result-object v0

    const-string v1, "platformextension"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_0

    .line 415
    sget p2, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p2, p2, 0x5f

    rem-int/lit16 p2, p2, 0x80

    sput p2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 416
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFi1lSDK;

    invoke-interface {p0}, Lcom/appsflyer/internal/AFi1lSDK;->getMonetizationNetwork()Ljava/util/Map;

    move-result-object p0

    const-string p2, "platform_extension_v2"

    invoke-interface {p1, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    :cond_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p0, p0, 0x3b

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    return-void
.end method

.method private static getCurrencyIso4217Code(Ljava/io/File;)Z
    .locals 2

    if-eqz p0, :cond_2

    .line 468
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x11

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    const/4 p0, 0x0

    throw p0

    :cond_2
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x5f

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    const/4 p0, 0x1

    return p0
.end method

.method private final getMediationNetwork()Lcom/appsflyer/AppsFlyerProperties;
    .locals 3

    .line 269
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v1, -0x6b2b3d0b

    const v2, 0x6b2b3d12

    invoke-static {v0, v1, v2, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/AppsFlyerProperties;

    return-object p0
.end method

.method private static synthetic getMediationNetwork([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    const/4 v0, 0x0

    aget-object v1, p0, v0

    check-cast v1, Ljava/io/File;

    const/4 v2, 0x1

    aget-object p0, p0, v2

    check-cast p0, Ljava/lang/String;

    .line 249
    sget v2, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v3, v2, 0x2b

    rem-int/lit16 v4, v3, 0x80

    sput v4, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    rem-int/lit8 v3, v3, 0x2

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    const/16 v3, 0x48

    .line 250
    div-int/2addr v3, v0

    if-nez v1, :cond_1

    goto :goto_0

    :cond_0
    if-nez v1, :cond_1

    :goto_0
    add-int/lit8 v2, v2, 0x37

    rem-int/lit16 v2, v2, 0x80

    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    return-object v4

    .line 251
    :cond_1
    :try_start_0
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 252
    new-instance v2, Ljava/io/InputStreamReader;

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v5

    invoke-direct {v2, v3, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 253
    :try_start_1
    invoke-virtual {v0, v2}, Ljava/util/Properties;->load(Ljava/io/Reader;)V

    .line 254
    const-string v3, "Found PreInstall property!"

    invoke-static {v3}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 255
    invoke-virtual {v0, p0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 256
    :try_start_2
    invoke-virtual {v2}, Ljava/io/Reader;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return-object p0

    :catchall_0
    move-exception v0

    .line 257
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object p0

    :catchall_1
    move-exception p0

    goto :goto_1

    :catchall_2
    move-exception p0

    move-object v2, v4

    .line 258
    :goto_1
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    if-eqz v2, :cond_2

    .line 259
    :goto_2
    :try_start_4
    invoke-virtual {v2}, Ljava/io/Reader;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    goto :goto_3

    :catchall_3
    move-exception p0

    .line 260
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    :catchall_4
    move-exception p0

    goto :goto_4

    :catch_0
    move-object v2, v4

    .line 261
    :catch_1
    :try_start_5
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "PreInstall file wasn\'t found: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    :goto_3
    return-object v4

    :goto_4
    if-eqz v2, :cond_3

    .line 262
    :try_start_6
    invoke-virtual {v2}, Ljava/io/Reader;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    .line 263
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x17

    :goto_5
    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    goto :goto_6

    :catchall_5
    move-exception v0

    .line 264
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6

    .line 265
    :cond_3
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x3d

    goto :goto_5

    .line 266
    :goto_6
    throw p0
.end method

.method private static getMediationNetwork(Lcom/appsflyer/internal/AFd1rSDK;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 267
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-int p1, v0

    const v0, -0x7504828d

    const v1, 0x7504828f

    invoke-static {p0, v0, v1, p1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private final getMediationNetwork(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 268
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v0, -0x78bda01b

    const v1, 0x78bda024

    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private getMediationNetwork(Ljava/util/Map;Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const v2, -0x6b2b3d0b

    .line 13
    .line 14
    .line 15
    const v3, 0x6b2b3d12

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/appsflyer/AppsFlyerProperties;

    .line 23
    .line 24
    const-string v1, "deviceTrackingDisabled"

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 34
    .line 35
    add-int/lit8 p0, p0, 0x27

    .line 36
    .line 37
    rem-int/lit16 p2, p0, 0x80

    .line 38
    .line 39
    sput p2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 40
    .line 41
    rem-int/lit8 p0, p0, 0x2

    .line 42
    .line 43
    const-string p2, "true"

    .line 44
    .line 45
    if-nez p0, :cond_0

    .line 46
    .line 47
    invoke-interface {p1, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 51
    .line 52
    add-int/lit8 p0, p0, 0x41

    .line 53
    .line 54
    rem-int/lit16 p1, p0, 0x80

    .line 55
    .line 56
    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 57
    .line 58
    rem-int/lit8 p0, p0, 0x2

    .line 59
    .line 60
    if-eqz p0, :cond_6

    .line 61
    .line 62
    const/16 p0, 0x22

    .line 63
    .line 64
    div-int/2addr p0, v2

    .line 65
    return-void

    .line 66
    :cond_0
    invoke-interface {p1, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    const/4 p0, 0x0

    .line 70
    throw p0

    .line 71
    :cond_1
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lcom/appsflyer/internal/AFg1rSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFd1rSDK;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 82
    .line 83
    add-int/lit8 v1, v1, 0x43

    .line 84
    .line 85
    rem-int/lit16 v1, v1, 0x80

    .line 86
    .line 87
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 88
    .line 89
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-nez v1, :cond_2

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    const-string v1, "imei"

    .line 97
    .line 98
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    :cond_3
    :goto_0
    filled-new-array {p0, p2}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    const v1, -0x78bda01b

    .line 110
    .line 111
    .line 112
    const v2, 0x78bda024

    .line 113
    .line 114
    .line 115
    invoke-static {p2, v1, v2, v0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    check-cast p2, Ljava/lang/String;

    .line 120
    .line 121
    if-eqz p2, :cond_4

    .line 122
    .line 123
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 124
    .line 125
    add-int/lit8 v0, v0, 0x37

    .line 126
    .line 127
    rem-int/lit16 v0, v0, 0x80

    .line 128
    .line 129
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 130
    .line 131
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 132
    .line 133
    const-string v1, "androidIdCached"

    .line 134
    .line 135
    invoke-interface {v0, v1, p2}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    const-string v0, "android_id"

    .line 139
    .line 140
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_4
    const-string p2, "Android ID was not collected."

    .line 145
    .line 146
    invoke-static {p2}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    :goto_1
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 150
    .line 151
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1rSDK;->getRevenue(Landroid/content/Context;)Lcom/appsflyer/internal/AFb1ySDK;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    if-eqz p0, :cond_6

    .line 156
    .line 157
    new-instance p2, Ljava/util/LinkedHashMap;

    .line 158
    .line 159
    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1ySDK;->getMonetizationNetwork:Ljava/lang/Boolean;

    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 165
    .line 166
    .line 167
    const-string v1, "isManual"

    .line 168
    .line 169
    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1ySDK;->AFAdRevenueData:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 175
    .line 176
    .line 177
    const-string v1, "val"

    .line 178
    .line 179
    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1ySDK;->getMediationNetwork:Ljava/lang/Boolean;

    .line 183
    .line 184
    if-eqz p0, :cond_5

    .line 185
    .line 186
    const-string v0, "isLat"

    .line 187
    .line 188
    invoke-interface {p2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    :cond_5
    const-string p0, "oaid"

    .line 192
    .line 193
    invoke-interface {p1, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    :cond_6
    return-void
.end method

.method private static getMediationNetwork(Ljava/util/Map;Z)V
    .locals 2
    .param p0    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z)V"
        }
    .end annotation

    .line 243
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x27

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    const-string v1, "af_preinstalled"

    if-eqz v0, :cond_0

    .line 244
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 245
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x4b

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    return-void

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 247
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x0

    .line 248
    throw p0
.end method

.method private static getMonetizationNetwork(Ljava/lang/String;)Ljava/io/File;
    .locals 3

    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 228
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v1, v1, 0x1f

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_0

    .line 229
    :try_start_0
    invoke-static {p0}, Lkotlin/text/StringsKt;->Z0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 230
    new-instance v1, Ljava/io/File;

    invoke-static {p0}, Lkotlin/text/StringsKt;->Z0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v1

    :catchall_0
    move-exception p0

    goto :goto_0

    .line 231
    :cond_0
    invoke-static {p0}, Lkotlin/text/StringsKt;->Z0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    .line 232
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 233
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 234
    :cond_1
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x33

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    return-object v0
.end method

.method private static synthetic getMonetizationNetwork([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    const/4 v0, 0x0

    aget-object v1, p0, v0

    check-cast v1, Lcom/appsflyer/internal/AFg1eSDK;

    const/4 v2, 0x1

    aget-object p0, p0, v2

    check-cast p0, Ljava/util/Map;

    .line 217
    sget v2, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v2, v2, 0x3

    rem-int/lit16 v2, v2, 0x80

    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 218
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x0

    .line 219
    :try_start_0
    iget-object v3, v1, Lcom/appsflyer/internal/AFg1eSDK;->toString:Lcom/appsflyer/internal/AFd1kSDK;

    iget-object v1, v1, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    invoke-static {v3, v1}, Lcom/appsflyer/internal/AFb1lSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFd1kSDK;Lcom/appsflyer/internal/AFd1rSDK;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 220
    sget v3, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v3, v3, 0x3

    rem-int/lit16 v4, v3, 0x80

    sput v4, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    rem-int/lit8 v3, v3, 0x2

    const-string v4, "uid"

    if-eqz v3, :cond_0

    .line 221
    :try_start_1
    invoke-interface {p0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 p0, 0x5e

    div-int/2addr p0, v0

    return-object v2

    :catchall_0
    move-exception p0

    goto :goto_0

    :cond_0
    invoke-interface {p0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v2

    .line 222
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "ERROR: could not get uid "

    .line 223
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 224
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 226
    invoke-static {v1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 227
    :cond_1
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0xb

    rem-int/lit16 v1, p0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_2

    const/16 p0, 0xd

    div-int/2addr p0, v0

    :cond_2
    return-object v2
.end method

.method private getMonetizationNetwork(Ljava/text/SimpleDateFormat;)Ljava/lang/String;
    .locals 7
    .param p1    # Ljava/text/SimpleDateFormat;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 203
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x5f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const-string v2, "appsFlyerFirstInstall"

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 204
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    invoke-interface {v0, v2, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x45

    .line 205
    div-int/lit8 v1, v1, 0x0

    if-nez v0, :cond_2

    goto :goto_0

    .line 206
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 207
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    invoke-interface {v0, v2, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 208
    :goto_0
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v0, v0, 0x37

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 209
    invoke-direct {p0}, Lcom/appsflyer/internal/AFg1eSDK;->component4()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 210
    const-string v0, "AppsFlyer: first launch detected"

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 211
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {p1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    :goto_1
    move-object v0, p1

    goto :goto_2

    .line 212
    :cond_1
    sget p1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p1, p1, 0x4f

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 213
    const-string p1, ""

    goto :goto_1

    .line 214
    :goto_2
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    invoke-interface {p0, v2, v0}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    :cond_2
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    const-string p0, "AppsFlyer: first launch date: "

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lcom/appsflyer/internal/AFh1ySDK;->i$default(Lcom/appsflyer/internal/AFh1ySDK;Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 216
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0
.end method

.method private final getMonetizationNetwork(Ljava/util/Map;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "versionCode"

    .line 2
    .line 3
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 4
    .line 5
    add-int/lit8 v1, v1, 0x15

    .line 6
    .line 7
    rem-int/lit16 v1, v1, 0x80

    .line 8
    .line 9
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    :try_start_0
    iget-object v2, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v3, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const/4 v4, 0x0

    .line 25
    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v3, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 30
    .line 31
    invoke-interface {v3, v0, v4}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    iget v5, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 36
    .line 37
    if-le v5, v3, :cond_0

    .line 38
    .line 39
    iget-object v3, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 40
    .line 41
    invoke-interface {v3, v0, v5}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto/16 :goto_1

    .line 47
    .line 48
    :cond_0
    :goto_0
    const-string v0, "app_version_code"

    .line 49
    .line 50
    iget v3, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 51
    .line 52
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-interface {p1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    const-string v0, "app_version_name"

    .line 60
    .line 61
    iget-object v3, p0, Lcom/appsflyer/internal/AFg1eSDK;->component1:Lcom/appsflyer/internal/AFd1pSDK;

    .line 62
    .line 63
    iget-object v3, v3, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 64
    .line 65
    iget-object v3, v3, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 66
    .line 67
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-static {v3, v5}, Lcom/appsflyer/internal/AFb1vSDK;->getMonetizationNetwork(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-interface {p1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    const-string v0, "targetSDKver"

    .line 79
    .line 80
    iget-object v3, p0, Lcom/appsflyer/internal/AFg1eSDK;->component1:Lcom/appsflyer/internal/AFd1pSDK;

    .line 81
    .line 82
    iget-object v3, v3, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 83
    .line 84
    iget-object v3, v3, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 85
    .line 86
    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    iget v3, v3, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 91
    .line 92
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-interface {p1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    iget-wide v5, v2, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    .line 100
    .line 101
    iget-wide v2, v2, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    .line 102
    .line 103
    const-string v0, "date1"

    .line 104
    .line 105
    invoke-direct {p0}, Lcom/appsflyer/internal/AFg1eSDK;->AFAdRevenueData()Ljava/text/SimpleDateFormat;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    new-instance v8, Ljava/util/Date;

    .line 110
    .line 111
    invoke-direct {v8, v5, v6}, Ljava/util/Date;-><init>(J)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v7, v8}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    invoke-interface {p1, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    const-string v0, "date2"

    .line 122
    .line 123
    invoke-direct {p0}, Lcom/appsflyer/internal/AFg1eSDK;->AFAdRevenueData()Ljava/text/SimpleDateFormat;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    new-instance v6, Ljava/util/Date;

    .line 128
    .line 129
    invoke-direct {v6, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v5, v6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-interface {p1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    const/16 v0, 0xf

    .line 140
    .line 141
    const/4 v2, 0x7

    .line 142
    filled-new-array {v4, v0, v4, v2}, [I

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    const-string v2, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0000\u0001\u0001\u0001"

    .line 147
    .line 148
    new-array v3, v1, [Ljava/lang/Object;

    .line 149
    .line 150
    invoke-static {v0, v1, v2, v3}, Lcom/appsflyer/internal/AFg1eSDK;->a([IZLjava/lang/String;[Ljava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    aget-object v0, v3, v4

    .line 154
    .line 155
    check-cast v0, Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-direct {p0}, Lcom/appsflyer/internal/AFg1eSDK;->AFAdRevenueData()Ljava/text/SimpleDateFormat;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 166
    .line 167
    .line 168
    invoke-direct {p0, v2}, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork(Ljava/text/SimpleDateFormat;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    .line 174
    .line 175
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 176
    .line 177
    add-int/lit8 p0, p0, 0x5f

    .line 178
    .line 179
    rem-int/lit16 p0, p0, 0x80

    .line 180
    .line 181
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 182
    .line 183
    return-void

    .line 184
    :goto_1
    const-string p1, "Exception while collecting app version data "

    .line 185
    .line 186
    invoke-static {p1, p0, v1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;Z)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method private static getMonetizationNetwork(Ljava/util/Map;Ljava/lang/String;)V
    .locals 1
    .param p0    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 190
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_0

    .line 191
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x59

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 192
    const-string v0, "phone"

    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    :cond_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p0, p0, 0x27

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_1

    const/16 p0, 0x1d

    div-int/lit8 p0, p0, 0x0

    :cond_1
    return-void
.end method

.method private static synthetic getRevenue([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    const/4 v0, 0x0

    aget-object v0, p0, v0

    check-cast v0, Lcom/appsflyer/internal/AFd1rSDK;

    const/4 v1, 0x1

    aget-object p0, p0, v1

    check-cast p0, Ljava/lang/String;

    .line 307
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v1, v1, 0x4d

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v2, 0x0

    const-string v3, "CACHED_CHANNEL"

    if-nez v1, :cond_1

    .line 308
    invoke-interface {v0, v3, v2}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 309
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x4f

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    return-object v1

    .line 310
    :cond_0
    invoke-interface {v0, v3, p0}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    .line 311
    :cond_1
    invoke-interface {v0, v3, v2}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 312
    throw v2
.end method

.method private final getRevenue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 313
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v0, v0, 0x3f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    rem-int/lit8 v0, v0, 0x2

    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component1:Lcom/appsflyer/internal/AFd1pSDK;

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p1, p1, 0x71

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    return-object p0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue(Ljava/lang/String;)Ljava/lang/String;

    const/4 p0, 0x0

    throw p0
.end method

.method private getRevenue(Lcom/appsflyer/internal/AFa1mSDK;Ljava/lang/String;Ljava/lang/String;Lcom/appsflyer/internal/AFc1bSDK;)V
    .locals 4
    .param p1    # Lcom/appsflyer/internal/AFa1mSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/appsflyer/internal/AFc1bSDK;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 288
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v0, v0, 0x35

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_2

    .line 289
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 290
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    move-result-object v0

    .line 291
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFf1zSDK;

    move-result-object p1

    sget-object v1, Lcom/appsflyer/internal/AFf1zSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFf1zSDK;

    if-ne p1, v1, :cond_0

    .line 292
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->areAllFieldsValid(Ljava/util/Map;)V

    .line 293
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->copydefault(Ljava/util/Map;)V

    .line 294
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->hashCode(Ljava/util/Map;)V

    .line 295
    iget-object p1, p0, Lcom/appsflyer/internal/AFg1eSDK;->toString:Lcom/appsflyer/internal/AFd1kSDK;

    iget-object v1, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    invoke-static {p1, v1}, Lcom/appsflyer/internal/AFb1gSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFd1kSDK;Lcom/appsflyer/internal/AFd1rSDK;)V

    .line 296
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->equals(Ljava/util/Map;)V

    .line 297
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    const v2, -0xdb8f20c

    const v3, 0xdb8f218

    invoke-static {p1, v2, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 298
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    const v2, 0x79c8532e

    const v3, -0x79c85326

    invoke-static {p1, v2, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 299
    invoke-static {v0, p3}, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork(Ljava/util/Map;Ljava/lang/String;)V

    .line 300
    filled-new-array {p0, v0, p2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p2

    const p3, 0x702ae552

    const v1, -0x702ae54e

    invoke-static {p1, p3, v1, p2}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 301
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->toString(Ljava/util/Map;)V

    if-eqz p4, :cond_1

    .line 302
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p0, p0, 0x25

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 303
    invoke-virtual {p4, v0}, Lcom/appsflyer/internal/AFc1bSDK;->getCurrencyIso4217Code(Ljava/util/Map;)V

    :cond_1
    return-void

    .line 304
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 305
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 306
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFf1zSDK;

    sget-object p0, Lcom/appsflyer/internal/AFf1zSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFf1zSDK;

    const/4 p0, 0x0

    throw p0
.end method

.method private final getRevenue(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 256
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget-wide v0, p0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    .line 257
    const-string p0, "yyyy-MM-dd_HHmmssZ"

    .line 258
    new-instance v2, Ljava/text/SimpleDateFormat;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v2, p0, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 259
    const-string p0, "installDate"

    .line 260
    const-string v3, "UTC"

    invoke-static {v3}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 261
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 262
    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 263
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p0, p0, 0x3d

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    return-void

    :catch_0
    move-exception p0

    .line 264
    const-string p1, "Exception while collecting install date. "

    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private getRevenue(Ljava/util/Map;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 314
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const p2, 0x702ae552

    const v0, -0x702ae54e

    invoke-static {p1, p2, v0, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method private getRevenue(Ljava/util/Map;Z)V
    .locals 5
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z)V"
        }
    .end annotation

    .line 265
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 266
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 267
    const-string v1, "ro.product.cpu.abi"

    invoke-static {v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "cpu_abi"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    const-string v1, "ro.product.cpu.abi2"

    invoke-static {v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "cpu_abi2"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    const-string v1, "os.arch"

    invoke-static {v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "arch"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    const-string v1, "ro.build.display.id"

    invoke-static {v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "build_display_id"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-eqz p2, :cond_1

    .line 271
    sget p2, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p2, p2, 0x65

    rem-int/lit16 p2, p2, 0x80

    sput p2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 272
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->component1(Ljava/util/Map;)V

    .line 273
    iget-object p2, p0, Lcom/appsflyer/internal/AFg1eSDK;->component1:Lcom/appsflyer/internal/AFd1pSDK;

    .line 274
    iget-object p2, p2, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    const-string v3, "appsFlyerCount"

    const/4 v4, 0x0

    invoke-interface {p2, v3, v4}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    move-result p2

    if-gt p2, v2, :cond_1

    .line 275
    sget p2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p2, p2, 0x11

    rem-int/lit16 v3, p2, 0x80

    sput v3, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/2addr p2, v2

    .line 276
    iget-object v3, p0, Lcom/appsflyer/internal/AFg1eSDK;->getRevenue:Lcom/appsflyer/internal/AFj1uSDK;

    if-eqz p2, :cond_0

    invoke-interface {v3}, Lcom/appsflyer/internal/AFj1uSDK;->getMediationNetwork()Ljava/util/Map;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    goto :goto_0

    :cond_0
    invoke-interface {v3}, Lcom/appsflyer/internal/AFj1uSDK;->getMediationNetwork()Ljava/util/Map;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 277
    throw v1

    :cond_1
    :goto_0
    iget-object p2, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFb1zSDK;

    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    invoke-interface {p2, p0}, Lcom/appsflyer/internal/AFb1zSDK;->getMonetizationNetwork(Landroid/content/Context;)Ljava/util/Map;

    move-result-object p0

    .line 278
    const-string p2, "dim"

    invoke-interface {v0, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    const-string p0, "deviceData"

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x6d

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/2addr p0, v2

    if-eqz p0, :cond_2

    return-void

    :cond_2
    throw v1
.end method

.method private final hashCode(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x4b

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Lcom/appsflyer/internal/AFh1zSDK;->getRevenue(Landroid/content/Context;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    const/16 v0, 0x20

    .line 20
    .line 21
    div-int/lit8 v0, v0, 0x0

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-static {p0}, Lcom/appsflyer/internal/AFh1zSDK;->getRevenue(Landroid/content/Context;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    :goto_0
    const-string p0, "inst_app"

    .line 33
    .line 34
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_1
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 40
    .line 41
    add-int/lit8 p0, p0, 0x6f

    .line 42
    .line 43
    rem-int/lit16 p0, p0, 0x80

    .line 44
    .line 45
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 46
    .line 47
    return-void
.end method

.method private registerClient(Ljava/util/Map;)V
    .locals 2
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x6b

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x5d

    .line 25
    .line 26
    rem-int/lit16 v0, v0, 0x80

    .line 27
    .line 28
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string v0, "appsflyerKey"

    .line 38
    .line 39
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 44
    .line 45
    add-int/lit8 p0, p0, 0x71

    .line 46
    .line 47
    rem-int/lit16 p0, p0, 0x80

    .line 48
    .line 49
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    throw p0
.end method

.method private toString(Ljava/util/Map;)V
    .locals 4
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component2:Lcom/appsflyer/internal/AFh1qSDK;

    .line 5
    .line 6
    iget-wide v0, p0, Lcom/appsflyer/internal/AFh1qSDK;->hashCode:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 15
    .line 16
    add-int/lit8 p0, p0, 0x73

    .line 17
    .line 18
    rem-int/lit16 p0, p0, 0x80

    .line 19
    .line 20
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 21
    .line 22
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "prev_session_dur"

    .line 27
    .line 28
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    :cond_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 32
    .line 33
    add-int/lit8 p0, p0, 0x29

    .line 34
    .line 35
    rem-int/lit16 p0, p0, 0x80

    .line 36
    .line 37
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 38
    .line 39
    return-void
.end method

.method private unregisterClient(Ljava/util/Map;)V
    .locals 2
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const v0, -0x55bdcc9b

    .line 10
    .line 11
    .line 12
    const v1, 0x55bdcc9e

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private static v_(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/PackageInfo;
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x27

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 14
    .line 15
    const/16 v1, 0x65

    .line 16
    .line 17
    if-lt v0, v1, :cond_2

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 21
    .line 22
    const/16 v1, 0x21

    .line 23
    .line 24
    if-lt v0, v1, :cond_2

    .line 25
    .line 26
    :goto_0
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 27
    .line 28
    add-int/lit8 v0, v0, 0x73

    .line 29
    .line 30
    rem-int/lit16 v1, v0, 0x80

    .line 31
    .line 32
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 33
    .line 34
    rem-int/lit8 v0, v0, 0x2

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    const-wide/16 v0, 0x1

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/appsflyer/internal/s;->a(J)Landroid/content/pm/PackageManager$PackageInfoFlags;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {p0, p1, v0}, Lcom/appsflyer/internal/t;->a(Landroid/content/pm/PackageManager;Ljava/lang/String;Landroid/content/pm/PackageManager$PackageInfoFlags;)Landroid/content/pm/PackageInfo;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_1
    const-wide/16 v0, 0x0

    .line 53
    .line 54
    invoke-static {v0, v1}, Lcom/appsflyer/internal/s;->a(J)Landroid/content/pm/PackageManager$PackageInfoFlags;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {p0, p1, v0}, Lcom/appsflyer/internal/t;->a(Landroid/content/pm/PackageManager;Ljava/lang/String;Landroid/content/pm/PackageManager$PackageInfoFlags;)Landroid/content/pm/PackageInfo;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_2
    const/4 v0, 0x0

    .line 67
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    return-object p0
.end method

.method private valueOf(Ljava/util/Map;)V
    .locals 5
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x11

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component1:Lcom/appsflyer/internal/AFd1pSDK;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFd1pSDK;->component4()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/appsflyer/internal/AFg1eSDK;->component3:Lcom/appsflyer/internal/AFd1rSDK;

    .line 19
    .line 20
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    long-to-int v2, v2

    .line 29
    const v3, -0x7504828d

    .line 30
    .line 31
    .line 32
    const v4, 0x7504828f

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v3, v4, v2}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ljava/lang/String;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    const/4 v3, 0x1

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-nez v4, :cond_0

    .line 50
    .line 51
    move v4, v3

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    move v4, v2

    .line 54
    :goto_0
    if-nez v1, :cond_1

    .line 55
    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 59
    .line 60
    add-int/lit8 v1, v1, 0xf

    .line 61
    .line 62
    rem-int/lit16 v1, v1, 0x80

    .line 63
    .line 64
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 65
    .line 66
    move v2, v3

    .line 67
    :cond_1
    if-nez v4, :cond_2

    .line 68
    .line 69
    if-eqz v2, :cond_3

    .line 70
    .line 71
    :cond_2
    const-string v1, "af_latestchannel"

    .line 72
    .line 73
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    :cond_3
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    const v2, 0x71d74625

    .line 85
    .line 86
    .line 87
    const v3, -0x71d7461a

    .line 88
    .line 89
    .line 90
    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Ljava/lang/String;

    .line 95
    .line 96
    if-eqz v0, :cond_4

    .line 97
    .line 98
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    .line 111
    .line 112
    const-string v1, "af_installstore"

    .line 113
    .line 114
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 118
    .line 119
    add-int/lit8 v0, v0, 0x59

    .line 120
    .line 121
    rem-int/lit16 v0, v0, 0x80

    .line 122
    .line 123
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 124
    .line 125
    :cond_4
    invoke-direct {p0}, Lcom/appsflyer/internal/AFg1eSDK;->equals()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    if-eqz v0, :cond_5

    .line 130
    .line 131
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 143
    .line 144
    .line 145
    const-string v1, "af_preinstall_name"

    .line 146
    .line 147
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    :cond_5
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 155
    .line 156
    .line 157
    move-result p0

    .line 158
    const v1, -0x5ffa023b

    .line 159
    .line 160
    .line 161
    const v2, 0x5ffa023b

    .line 162
    .line 163
    .line 164
    invoke-static {v0, v1, v2, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    check-cast p0, Ljava/lang/String;

    .line 169
    .line 170
    if-eqz p0, :cond_7

    .line 171
    .line 172
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 173
    .line 174
    add-int/lit8 v0, v0, 0x75

    .line 175
    .line 176
    rem-int/lit16 v1, v0, 0x80

    .line 177
    .line 178
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 179
    .line 180
    rem-int/lit8 v0, v0, 0x2

    .line 181
    .line 182
    const-string v1, "af_currentstore"

    .line 183
    .line 184
    if-eqz v0, :cond_6

    .line 185
    .line 186
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 198
    .line 199
    .line 200
    invoke-interface {p1, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    return-void

    .line 204
    :cond_6
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 216
    .line 217
    .line 218
    invoke-interface {p1, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    const/4 p0, 0x0

    .line 222
    throw p0

    .line 223
    :cond_7
    return-void
.end method

.method private values(Ljava/util/Map;)V
    .locals 3
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x61

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const v1, -0x6b2b3d0b

    .line 21
    .line 22
    .line 23
    const v2, 0x6b2b3d12

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1, v2, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/appsflyer/AppsFlyerProperties;

    .line 31
    .line 32
    const-string v0, "sdkExtension"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 48
    .line 49
    add-int/lit8 v1, v1, 0x4d

    .line 50
    .line 51
    rem-int/lit16 v1, v1, 0x80

    .line 52
    .line 53
    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 54
    .line 55
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 60
    .line 61
    add-int/lit8 p0, p0, 0x4f

    .line 62
    .line 63
    rem-int/lit16 p0, p0, 0x80

    .line 64
    .line 65
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public final AFAdRevenueData(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 3
    .param p1    # Lcom/appsflyer/internal/AFa1mSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x15

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->AFAdRevenueData()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-direct {p0, v0, p1}, Lcom/appsflyer/internal/AFg1eSDK;->getRevenue(Ljava/util/Map;Z)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/appsflyer/internal/AFg1eSDK;->component3(Ljava/util/Map;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventParameterName(Ljava/util/Map;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->AFAdRevenueData(Ljava/util/Map;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/appsflyer/internal/AFg1eSDK;->equals:Lcom/appsflyer/internal/AFd1mSDK;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/appsflyer/internal/AFd1mSDK;->getRevenue:Ljava/lang/String;

    .line 38
    .line 39
    invoke-direct {p0, v0, p1}, Lcom/appsflyer/internal/AFg1eSDK;->getMediationNetwork(Ljava/util/Map;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->AFLogger(Ljava/util/Map;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget p1, p1, Landroid/content/res/Configuration;->mcc:I

    .line 56
    .line 57
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string v1, "mcc"

    .line 62
    .line 63
    invoke-static {v1, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object v1, p0, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 68
    .line 69
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iget v1, v1, Landroid/content/res/Configuration;->mnc:I

    .line 78
    .line 79
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const-string v2, "mnc"

    .line 84
    .line 85
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    filled-new-array {p1, v1}, [Lkotlin/Pair;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {p1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    const-string v1, "cell"

    .line 98
    .line 99
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    const v1, -0x225672f9

    .line 111
    .line 112
    .line 113
    const v2, 0x225672ff

    .line 114
    .line 115
    .line 116
    invoke-static {p1, v1, v2, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    check-cast p0, Ljava/lang/String;

    .line 121
    .line 122
    const-string p1, "sig"

    .line 123
    .line 124
    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    invoke-static {}, Lcom/appsflyer/internal/AFg1eSDK;->component3()J

    .line 128
    .line 129
    .line 130
    move-result-wide p0

    .line 131
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    const-string p1, "last_boot_time"

    .line 136
    .line 137
    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    const/4 p0, 0x0

    .line 141
    new-array p0, p0, [Ljava/lang/Object;

    .line 142
    .line 143
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 144
    .line 145
    .line 146
    move-result-wide v1

    .line 147
    long-to-int p1, v1

    .line 148
    const v1, -0x72865da8

    .line 149
    .line 150
    .line 151
    const v2, 0x72865db2

    .line 152
    .line 153
    .line 154
    invoke-static {p0, v1, v2, p1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    check-cast p0, Ljava/lang/String;

    .line 159
    .line 160
    const-string p1, "disk"

    .line 161
    .line 162
    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 166
    .line 167
    add-int/lit8 p0, p0, 0x41

    .line 168
    .line 169
    rem-int/lit16 p1, p0, 0x80

    .line 170
    .line 171
    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 172
    .line 173
    rem-int/lit8 p0, p0, 0x2

    .line 174
    .line 175
    if-eqz p0, :cond_0

    .line 176
    .line 177
    return-void

    .line 178
    :cond_0
    const/4 p0, 0x0

    .line 179
    throw p0
.end method

.method public final AFAdRevenueData(Ljava/util/Map;)V
    .locals 4
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 181
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 182
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component4:Lcom/appsflyer/internal/AFi1xSDK;

    .line 183
    iget-object v0, v0, Lcom/appsflyer/internal/AFi1xSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFi1wSDK;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/appsflyer/internal/AFi1wSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFi1ySDK;

    move-result-object v0

    goto :goto_0

    .line 184
    :cond_0
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v0, v0, 0x17

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    .line 185
    const-string v1, "network"

    .line 186
    iget-object v2, v0, Lcom/appsflyer/internal/AFi1ySDK;->AFAdRevenueData:Ljava/lang/String;

    .line 187
    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFi1ySDK;->getCurrencyIso4217Code()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "ivc"

    invoke-interface {p1, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v2, -0x6b2b3d0b

    const v3, 0x6b2b3d12

    invoke-static {v1, v2, v3, p0}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/AppsFlyerProperties;

    const-string v1, "disableCollectNetworkData"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-nez p0, :cond_2

    .line 190
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p0, p0, 0x5f

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 191
    iget-object v1, v0, Lcom/appsflyer/internal/AFi1ySDK;->getRevenue:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 192
    const-string p0, "operator"

    invoke-interface {p1, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_1
    add-int/lit8 p0, p0, 0x3d

    .line 193
    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 194
    :goto_1
    iget-object p0, v0, Lcom/appsflyer/internal/AFi1ySDK;->getCurrencyIso4217Code:Ljava/lang/String;

    if-eqz p0, :cond_2

    .line 195
    const-string v0, "carrier"

    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    return-void
.end method

.method public final getCurrencyIso4217Code(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 2
    .param p1    # Lcom/appsflyer/internal/AFa1mSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 418
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p0, p0, 0x21

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 419
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 420
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    move-result-object p0

    .line 421
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "open_referrer"

    .line 422
    iget-object v1, p1, Lcom/appsflyer/internal/AFa1mSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 423
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    iget-object v0, p1, Lcom/appsflyer/internal/AFa1mSDK;->component1:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 425
    invoke-static {v0}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 426
    :cond_0
    const-string v0, "af_web_referrer"

    .line 427
    iget-object p1, p1, Lcom/appsflyer/internal/AFa1mSDK;->component1:Ljava/lang/String;

    .line 428
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 429
    :cond_1
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x3d

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_2

    return-void

    :cond_2
    const/4 p0, 0x0

    throw p0
.end method

.method public final getCurrencyIso4217Code(Ljava/util/Map;)V
    .locals 5
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 373
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 374
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    const v2, -0x6b2b3d0b

    const v3, 0x6b2b3d12

    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/appsflyer/AppsFlyerProperties;

    const-string v1, "appid"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 375
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    :cond_0
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/appsflyer/AppsFlyerProperties;

    const-string v1, "currencyCode"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 377
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v1, v1, 0x1d

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 378
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v4, 0x3

    if-eq v1, v4, :cond_1

    .line 379
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "WARNING: currency code should be 3 characters!!! \'"

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 380
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    const-string v4, "\' is not a legal value."

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 383
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 384
    :cond_1
    const-string v1, "currency"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 385
    :cond_2
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/appsflyer/AppsFlyerProperties;

    const-string v1, "IS_UPDATE"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 386
    const-string v1, "isUpdate"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v0, v0, 0xb

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 388
    :cond_3
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/appsflyer/AppsFlyerProperties;

    const-string v1, "additionalCustomData"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 389
    const-string v1, "customData"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    :cond_4
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/appsflyer/AppsFlyerProperties;

    const-string v1, "AppUserId"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 391
    const-string v1, "appUserId"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    :cond_5
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/appsflyer/AppsFlyerProperties;

    const-string v1, "userEmails"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 393
    const-string v1, "user_emails"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    :cond_6
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->equals:Lcom/appsflyer/internal/AFd1mSDK;

    .line 395
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1mSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFd1uSDK;

    if-eqz p0, :cond_7

    .line 396
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1uSDK;->getCurrencyIso4217Code:[Ljava/lang/String;

    if-eqz p0, :cond_7

    .line 397
    const-string v0, "sharing_filter"

    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    return-void
.end method

.method public final getCurrencyIso4217Code(Ljava/util/Map;ZLkotlin/jvm/functions/Function0;)V
    .locals 2
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 398
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x6b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    .line 399
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 400
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFg1eSDK;->getRevenue(Ljava/util/Map;)V

    .line 401
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork(Ljava/util/Map;)V

    .line 402
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFg1eSDK;->valueOf(Ljava/util/Map;)V

    .line 403
    invoke-static {p1, p2}, Lcom/appsflyer/internal/AFg1eSDK;->getMediationNetwork(Ljava/util/Map;Z)V

    .line 404
    invoke-direct {p0, p1, p3}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code(Ljava/util/Map;Lkotlin/jvm/functions/Function0;)V

    .line 405
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p0, p0, 0x2d

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    return-void

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 406
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFg1eSDK;->getRevenue(Ljava/util/Map;)V

    .line 407
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFg1eSDK;->getMonetizationNetwork(Ljava/util/Map;)V

    .line 408
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFg1eSDK;->valueOf(Ljava/util/Map;)V

    .line 409
    invoke-static {p1, p2}, Lcom/appsflyer/internal/AFg1eSDK;->getMediationNetwork(Ljava/util/Map;Z)V

    .line 410
    invoke-direct {p0, p1, p3}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code(Ljava/util/Map;Lkotlin/jvm/functions/Function0;)V

    const/4 p0, 0x0

    .line 411
    throw p0
.end method

.method public final getMediationNetwork(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 5
    .param p1    # Lcom/appsflyer/internal/AFa1mSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 216
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x61

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 217
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 218
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    move-result-object v0

    .line 219
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->AFAdRevenueData()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 220
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v1, v1, 0x3f

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 221
    iget-object v1, p1, Lcom/appsflyer/internal/AFa1mSDK;->component2:Ljava/lang/String;

    .line 222
    iget-object v2, p0, Lcom/appsflyer/internal/AFg1eSDK;->equals:Lcom/appsflyer/internal/AFd1mSDK;

    .line 223
    iget-object v3, v2, Lcom/appsflyer/internal/AFd1mSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 224
    iget-object v2, v2, Lcom/appsflyer/internal/AFd1mSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFc1bSDK;

    .line 225
    invoke-direct {p0, p1, v1, v3, v2}, Lcom/appsflyer/internal/AFg1eSDK;->getRevenue(Lcom/appsflyer/internal/AFa1mSDK;Ljava/lang/String;Ljava/lang/String;Lcom/appsflyer/internal/AFc1bSDK;)V

    goto :goto_0

    .line 226
    :cond_0
    instance-of v1, p1, Lcom/appsflyer/internal/AFh1hSDK;

    if-nez v1, :cond_1

    .line 227
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 228
    iget-object v1, p1, Lcom/appsflyer/internal/AFa1mSDK;->component4:Ljava/lang/String;

    .line 229
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, v0, v1}, Lcom/appsflyer/internal/AFg1eSDK;->AFAdRevenueData(Ljava/util/Map;Ljava/lang/String;)V

    .line 230
    :cond_1
    :goto_0
    sget-object v1, Lcom/appsflyer/internal/AFf1zSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFf1zSDK;

    sget-object v2, Lcom/appsflyer/internal/AFf1zSDK;->hashCode:Lcom/appsflyer/internal/AFf1zSDK;

    sget-object v3, Lcom/appsflyer/internal/AFf1zSDK;->copydefault:Lcom/appsflyer/internal/AFf1zSDK;

    filled-new-array {v1, v2, v3}, [Lcom/appsflyer/internal/AFf1zSDK;

    move-result-object v1

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFf1zSDK;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 231
    sget v1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v1, v1, 0x1b

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    rem-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_2

    .line 232
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->copy(Ljava/util/Map;)V

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->copy(Ljava/util/Map;)V

    const/4 p0, 0x0

    .line 233
    throw p0

    :cond_3
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->registerClient(Ljava/util/Map;)V

    .line 234
    invoke-static {v0}, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType(Ljava/util/Map;)V

    .line 235
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->AFKeystoreWrapper(Ljava/util/Map;)V

    .line 236
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->values(Ljava/util/Map;)V

    .line 237
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    const v3, -0x55bdcc9b

    const v4, 0x55bdcc9e

    invoke-static {v1, v3, v4, v2}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 238
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->AFAdRevenueData()Z

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code(Ljava/util/Map;Z)V

    .line 239
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    const v3, -0x78383984

    const v4, 0x78383989

    invoke-static {v1, v3, v4, v2}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 240
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFg1eSDK;->e(Ljava/util/Map;)V

    .line 241
    invoke-static {v0, p1}, Lcom/appsflyer/internal/AFg1eSDK;->getCurrencyIso4217Code(Ljava/util/Map;Lcom/appsflyer/internal/AFa1mSDK;)V

    .line 242
    const-string p0, "af_events_api"

    const-string p1, "1"

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final getMediationNetwork(Ljava/util/Map;)V
    .locals 12
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 197
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 198
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->equals:Lcom/appsflyer/internal/AFd1mSDK;

    .line 199
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1mSDK;->AFAdRevenueData:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 200
    const-string v2, "af_deeplink"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 201
    sget p1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p1, p1, 0x55

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 p1, p1, 0x2

    const-string v0, "Skip \'af\' payload as deeplink was found by path"

    if-eqz p1, :cond_0

    .line 202
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    goto :goto_2

    :cond_0
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    throw v1

    .line 203
    :cond_1
    :try_start_0
    sget-object v3, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 204
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 205
    const-string v0, "isPush"

    const-string v4, "true"

    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 206
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 208
    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {p1}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 209
    :goto_0
    invoke-static {p1}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 210
    sget-object v2, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    sget-object v3, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    const/16 v10, 0x78

    const/4 v11, 0x0

    const-string v4, "Exception while trying to create JSONObject from pushPayload"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v2 .. v11}, Lcom/appsflyer/internal/AFh1ySDK;->e$default(Lcom/appsflyer/internal/AFh1ySDK;Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;ZZZZILjava/lang/Object;)V

    goto :goto_1

    .line 211
    :cond_2
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v0, v0, 0x43

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 212
    :goto_1
    invoke-static {p1}, Lkotlin/Result;->box-impl(Ljava/lang/Object;)Lkotlin/Result;

    .line 213
    :cond_3
    :goto_2
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->equals:Lcom/appsflyer/internal/AFd1mSDK;

    .line 214
    iput-object v1, p0, Lcom/appsflyer/internal/AFd1mSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 215
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x59

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_4

    return-void

    :cond_4
    throw v1
.end method

.method public final getMonetizationNetwork()Ljava/lang/Long;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 194
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v0, v0, 0x75

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    rem-int/lit8 v0, v0, 0x2

    .line 195
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->toString:Lcom/appsflyer/internal/AFd1kSDK;

    const/4 v1, 0x0

    if-nez v0, :cond_4

    .line 196
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    if-eqz p0, :cond_3

    .line 197
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 198
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, p0}, Lcom/appsflyer/internal/AFg1eSDK;->v_(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/PackageInfo;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 199
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 v0, v0, 0x1f

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    .line 200
    iget-wide v0, p0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    :cond_0
    iget-wide v2, p0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    throw v1

    :cond_1
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x49

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_2

    return-object v1

    :cond_2
    throw v1

    :cond_3
    return-object v1

    .line 201
    :cond_4
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 202
    throw v1
.end method

.method public final getRevenue()J
    .locals 3

    .line 281
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p0, p0, 0x41

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 p0, p0, 0x43

    rem-int/lit16 v2, p0, 0x80

    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    return-wide v0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method public final getRevenue(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 5
    .param p1    # Lcom/appsflyer/internal/AFa1mSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x15

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component1:Lcom/appsflyer/internal/AFd1pSDK;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFd1pSDK;->component2()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/util/Map;)Ljava/util/Map;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    const-string v2, "ad_ids_disabled"

    .line 33
    .line 34
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component1:Lcom/appsflyer/internal/AFd1pSDK;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1pSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFd1mSDK;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1mSDK;->component4:Lcom/appsflyer/internal/AFh1pSDK;

    .line 45
    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 49
    .line 50
    add-int/lit8 p0, p0, 0x65

    .line 51
    .line 52
    rem-int/lit16 p0, p0, 0x80

    .line 53
    .line 54
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    iget-object v2, v0, Lcom/appsflyer/internal/AFh1pSDK;->component4:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz v2, :cond_4

    .line 60
    .line 61
    sget v3, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 62
    .line 63
    add-int/lit8 v3, v3, 0x5

    .line 64
    .line 65
    rem-int/lit16 v4, v3, 0x80

    .line 66
    .line 67
    sput v4, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 68
    .line 69
    rem-int/lit8 v3, v3, 0x2

    .line 70
    .line 71
    if-eqz v3, :cond_3

    .line 72
    .line 73
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-nez v2, :cond_2

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    sget v2, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 81
    .line 82
    add-int/lit8 v2, v2, 0x77

    .line 83
    .line 84
    rem-int/lit16 v2, v2, 0x80

    .line 85
    .line 86
    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 87
    .line 88
    const-string v2, "gaidError"

    .line 89
    .line 90
    iget-object v3, v0, Lcom/appsflyer/internal/AFh1pSDK;->component4:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {p1, v2, v3}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 97
    .line 98
    .line 99
    throw v1

    .line 100
    :cond_4
    :goto_0
    sget v2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 101
    .line 102
    add-int/lit8 v2, v2, 0x31

    .line 103
    .line 104
    rem-int/lit16 v2, v2, 0x80

    .line 105
    .line 106
    sput v2, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 107
    .line 108
    :goto_1
    iget-object v2, v0, Lcom/appsflyer/internal/AFh1pSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 109
    .line 110
    if-eqz v2, :cond_5

    .line 111
    .line 112
    iget-object v3, v0, Lcom/appsflyer/internal/AFh1pSDK;->getMonetizationNetwork:Ljava/lang/Boolean;

    .line 113
    .line 114
    if-eqz v3, :cond_5

    .line 115
    .line 116
    sget v3, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 117
    .line 118
    add-int/lit8 v3, v3, 0x35

    .line 119
    .line 120
    rem-int/lit16 v3, v3, 0x80

    .line 121
    .line 122
    sput v3, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 123
    .line 124
    const-string v3, "advertiserId"

    .line 125
    .line 126
    invoke-virtual {p1, v3, v2}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 127
    .line 128
    .line 129
    iget-object v2, v0, Lcom/appsflyer/internal/AFh1pSDK;->getMonetizationNetwork:Ljava/lang/Boolean;

    .line 130
    .line 131
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    const-string v3, "advertiserIdEnabled"

    .line 136
    .line 137
    invoke-virtual {p1, v3, v2}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 138
    .line 139
    .line 140
    iget-object v0, v0, Lcom/appsflyer/internal/AFh1pSDK;->getMediationNetwork:Ljava/lang/Boolean;

    .line 141
    .line 142
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    const-string v2, "isGaidWithGps"

    .line 147
    .line 148
    invoke-virtual {p1, v2, v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 149
    .line 150
    .line 151
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1eSDK;->component1:Lcom/appsflyer/internal/AFd1pSDK;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1pSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFd1mSDK;

    .line 154
    .line 155
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1mSDK;->component4:Lcom/appsflyer/internal/AFh1pSDK;

    .line 156
    .line 157
    if-eqz v0, :cond_7

    .line 158
    .line 159
    sget v2, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 160
    .line 161
    add-int/lit8 v2, v2, 0x45

    .line 162
    .line 163
    rem-int/lit16 v3, v2, 0x80

    .line 164
    .line 165
    sput v3, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 166
    .line 167
    rem-int/lit8 v2, v2, 0x2

    .line 168
    .line 169
    iget-object v0, v0, Lcom/appsflyer/internal/AFh1pSDK;->component3:Ljava/lang/Boolean;

    .line 170
    .line 171
    if-eqz v2, :cond_6

    .line 172
    .line 173
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 174
    .line 175
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    goto :goto_3

    .line 180
    :cond_6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 181
    .line 182
    invoke-static {v0, p0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    throw v1

    .line 186
    :cond_7
    const/4 v0, 0x0

    .line 187
    :goto_3
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    const-string v1, "GAID_retry"

    .line 192
    .line 193
    invoke-virtual {p1, v1, v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 194
    .line 195
    .line 196
    sget-object v0, Lcom/appsflyer/internal/AFf1zSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFf1zSDK;

    .line 197
    .line 198
    sget-object v1, Lcom/appsflyer/internal/AFf1zSDK;->hashCode:Lcom/appsflyer/internal/AFf1zSDK;

    .line 199
    .line 200
    filled-new-array {v0, v1}, [Lcom/appsflyer/internal/AFf1zSDK;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFf1zSDK;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_9

    .line 217
    .line 218
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1eSDK;->equals:Lcom/appsflyer/internal/AFd1mSDK;

    .line 219
    .line 220
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1mSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFe1oSDK;

    .line 221
    .line 222
    if-eqz p0, :cond_8

    .line 223
    .line 224
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    invoke-static {p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/util/Map;)Ljava/util/Map;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 233
    .line 234
    .line 235
    iget-wide v0, p0, Lcom/appsflyer/internal/AFe1oSDK;->AFAdRevenueData:J

    .line 236
    .line 237
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    const-string v0, "fetchAdIdLatency"

    .line 242
    .line 243
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    return-void

    .line 247
    :cond_8
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    .line 248
    .line 249
    add-int/lit8 p0, p0, 0x37

    .line 250
    .line 251
    rem-int/lit16 p0, p0, 0x80

    .line 252
    .line 253
    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 254
    .line 255
    :cond_9
    return-void
.end method

.method public final getRevenue(Ljava/util/Map;II)V
    .locals 1
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;II)V"
        }
    .end annotation

    .line 282
    sget v0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    add-int/lit8 v0, v0, 0x2b

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    .line 283
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 284
    const-string v0, "counter"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    const-string p2, "iaecounter"

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    invoke-direct {p0}, Lcom/appsflyer/internal/AFg1eSDK;->copydefault()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p0

    const-string p2, "isFirstCall"

    invoke-interface {p1, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    sget p0, Lcom/appsflyer/internal/AFg1eSDK;->values:I

    add-int/lit8 p0, p0, 0x55

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFg1eSDK;->AFInAppEventType:I

    return-void
.end method
