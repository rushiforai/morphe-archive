.class public final Lcom/appsflyer/internal/AFd1dSDK;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/internal/AFd1bSDK;


# static fields
.field private static $10:I = 0x0

.field private static $11:I = 0x1

.field private static copydefault:J = -0x3abc1d235cf1f774L

.field private static equals:I = 0x1

.field private static hashCode:I


# instance fields
.field private final AFAdRevenueData:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final areAllFieldsValid:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private component1:Lcom/appsflyer/internal/AFd1bSDK$AFa1ySDK;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final component2:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final component3:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final component4:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1fSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final getMediationNetwork:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final getMonetizationNetwork:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final getRevenue:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/appsflyer/internal/AFd1fSDK;)V
    .locals 0
    .param p1    # Lcom/appsflyer/internal/AFd1fSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1fSDK;

    .line 8
    .line 9
    new-instance p1, Lcom/appsflyer/internal/AFd1dSDK$1;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Lcom/appsflyer/internal/AFd1dSDK$1;-><init>(Lcom/appsflyer/internal/AFd1dSDK;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1dSDK;->getMonetizationNetwork:Lkotlin/Lazy;

    .line 19
    .line 20
    new-instance p1, Lcom/appsflyer/internal/AFd1dSDK$3;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Lcom/appsflyer/internal/AFd1dSDK$3;-><init>(Lcom/appsflyer/internal/AFd1dSDK;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1dSDK;->getMediationNetwork:Lkotlin/Lazy;

    .line 30
    .line 31
    new-instance p1, Lcom/appsflyer/internal/AFd1dSDK$5;

    .line 32
    .line 33
    invoke-direct {p1, p0}, Lcom/appsflyer/internal/AFd1dSDK$5;-><init>(Lcom/appsflyer/internal/AFd1dSDK;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData:Lkotlin/Lazy;

    .line 41
    .line 42
    new-instance p1, Lcom/appsflyer/internal/AFd1dSDK$10;

    .line 43
    .line 44
    invoke-direct {p1, p0}, Lcom/appsflyer/internal/AFd1dSDK$10;-><init>(Lcom/appsflyer/internal/AFd1dSDK;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1dSDK;->getRevenue:Lkotlin/Lazy;

    .line 52
    .line 53
    new-instance p1, Lcom/appsflyer/internal/AFd1dSDK$4;

    .line 54
    .line 55
    invoke-direct {p1, p0}, Lcom/appsflyer/internal/AFd1dSDK$4;-><init>(Lcom/appsflyer/internal/AFd1dSDK;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1dSDK;->component3:Lkotlin/Lazy;

    .line 63
    .line 64
    const-string p1, "6.15.0"

    .line 65
    .line 66
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1dSDK;->component2:Ljava/lang/String;

    .line 67
    .line 68
    new-instance p1, Lcom/appsflyer/internal/AFd1dSDK$2;

    .line 69
    .line 70
    invoke-direct {p1, p0}, Lcom/appsflyer/internal/AFd1dSDK$2;-><init>(Lcom/appsflyer/internal/AFd1dSDK;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1dSDK;->areAllFieldsValid:Lkotlin/Lazy;

    .line 78
    .line 79
    new-instance p1, Lcom/appsflyer/internal/AFd1dSDK$6;

    .line 80
    .line 81
    invoke-direct {p1, p0}, Lcom/appsflyer/internal/AFd1dSDK$6;-><init>(Lcom/appsflyer/internal/AFd1dSDK;)V

    .line 82
    .line 83
    .line 84
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1dSDK;->component4:Lkotlin/Lazy;

    .line 89
    .line 90
    return-void
.end method

.method private static synthetic AFAdRevenueData([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p0, v0

    .line 3
    .line 4
    check-cast v1, Lcom/appsflyer/internal/AFd1dSDK;

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    aget-object p0, p0, v2

    .line 8
    .line 9
    check-cast p0, Lcom/appsflyer/internal/AFh1fSDK;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    rsub-int/lit8 v3, v3, 0x1

    .line 16
    .line 17
    new-array v2, v2, [Ljava/lang/Object;

    .line 18
    .line 19
    const-string v4, "\ue4bc\ubd63\u0efb\ue4de\uf4b6\uad3f\u9dd4\u71a4\uc244"

    .line 20
    .line 21
    invoke-static {v4, v3, v2}, Lcom/appsflyer/internal/AFd1dSDK;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    aget-object v0, v2, v0

    .line 25
    .line 26
    check-cast v0, Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v0, v2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const-string v0, "model"

    .line 39
    .line 40
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v0, v2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-direct {v1}, Lcom/appsflyer/internal/AFd1dSDK;->getRevenue()Lcom/appsflyer/internal/AFd1pSDK;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v2, "app_id"

    .line 59
    .line 60
    invoke-static {v2, v0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK;

    .line 65
    .line 66
    invoke-direct {v0}, Lcom/appsflyer/internal/AFb1aSDK;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1aSDK;->AFAdRevenueData()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const-string v2, "p_ex"

    .line 74
    .line 75
    invoke-static {v2, v0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 80
    .line 81
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v2, "api"

    .line 86
    .line 87
    invoke-static {v2, v0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    const-string v0, "sdk"

    .line 92
    .line 93
    iget-object v2, v1, Lcom/appsflyer/internal/AFd1dSDK;->component2:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v0, v2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 96
    .line 97
    .line 98
    move-result-object v8

    .line 99
    invoke-direct {v1}, Lcom/appsflyer/internal/AFd1dSDK;->getRevenue()Lcom/appsflyer/internal/AFd1pSDK;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-object v1, v0, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 104
    .line 105
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    .line 106
    .line 107
    invoke-static {v1, v0}, Lcom/appsflyer/internal/AFb1lSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFd1kSDK;Lcom/appsflyer/internal/AFd1rSDK;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    const-string v1, "uid"

    .line 112
    .line 113
    invoke-static {v1, v0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 114
    .line 115
    .line 116
    move-result-object v9

    .line 117
    const-string v0, "exc_config"

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFh1fSDK;->getCurrencyIso4217Code()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {v0, p0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 124
    .line 125
    .line 126
    move-result-object v10

    .line 127
    filled-new-array/range {v3 .. v10}, [Lkotlin/Pair;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-static {p0}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 136
    .line 137
    add-int/lit8 v0, v0, 0xf

    .line 138
    .line 139
    rem-int/lit16 v1, v0, 0x80

    .line 140
    .line 141
    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 142
    .line 143
    rem-int/lit8 v0, v0, 0x2

    .line 144
    .line 145
    if-nez v0, :cond_0

    .line 146
    .line 147
    return-object p0

    .line 148
    :cond_0
    const/4 p0, 0x0

    .line 149
    throw p0
.end method

.method private static final AFAdRevenueData(Lcom/appsflyer/internal/AFd1dSDK;)V
    .locals 1

    .line 150
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 v0, v0, 0x7b

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 151
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 152
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->copy()V

    .line 153
    sget p0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    add-int/lit8 p0, p0, 0x5d

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    return-void
.end method

.method private final AFAdRevenueData(Lcom/appsflyer/internal/AFh1fSDK;)V
    .locals 8

    .line 154
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 v0, v0, 0x9

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    rem-int/lit8 v0, v0, 0x2

    const-string v1, "af_send_exc_min"

    const-string v2, "af_send_exc_to_server_window"

    sget-object v3, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    if-eqz v0, :cond_0

    .line 155
    iget v0, p1, Lcom/appsflyer/internal/AFh1fSDK;->AFAdRevenueData:I

    .line 156
    iget p1, p1, Lcom/appsflyer/internal/AFh1fSDK;->getMonetizationNetwork:I

    .line 157
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    int-to-long v6, p1

    invoke-virtual {v3, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v6

    mul-long/2addr v4, v6

    .line 158
    :goto_0
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component2()Lcom/appsflyer/internal/AFd1rSDK;

    move-result-object p0

    .line 159
    invoke-interface {p0, v2, v4, v5}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;J)V

    .line 160
    invoke-interface {p0, v1, v0}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;I)V

    return-void

    .line 161
    :cond_0
    iget v0, p1, Lcom/appsflyer/internal/AFh1fSDK;->AFAdRevenueData:I

    .line 162
    iget p1, p1, Lcom/appsflyer/internal/AFh1fSDK;->getMonetizationNetwork:I

    .line 163
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    int-to-long v6, p1

    invoke-virtual {v3, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v6

    add-long/2addr v4, v6

    goto :goto_0
.end method

.method public static synthetic a(Lcom/appsflyer/internal/AFd1dSDK;)V
    .locals 0

    .line 88
    invoke-static {p0}, Lcom/appsflyer/internal/AFd1dSDK;->getMonetizationNetwork(Lcom/appsflyer/internal/AFd1dSDK;)V

    return-void
.end method

.method private static a(Ljava/lang/String;I[Ljava/lang/Object;)V
    .locals 11

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->$11:I

    .line 4
    .line 5
    add-int/lit8 v0, v0, 0x3f

    .line 6
    .line 7
    rem-int/lit16 v0, v0, 0x80

    .line 8
    .line 9
    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->$10:I

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    check-cast p0, [C

    .line 16
    .line 17
    new-instance v0, Lcom/appsflyer/internal/AFk1tSDK;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/appsflyer/internal/AFk1tSDK;-><init>()V

    .line 20
    .line 21
    .line 22
    sget-wide v1, Lcom/appsflyer/internal/AFd1dSDK;->copydefault:J

    .line 23
    .line 24
    const-wide v3, -0x430dd687b86fbed5L    # -4.032772242857732E-15

    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    xor-long/2addr v1, v3

    .line 30
    invoke-static {v1, v2, p0, p1}, Lcom/appsflyer/internal/AFk1tSDK;->getCurrencyIso4217Code(J[CI)[C

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 p1, 0x4

    .line 35
    iput p1, v0, Lcom/appsflyer/internal/AFk1tSDK;->AFAdRevenueData:I

    .line 36
    .line 37
    :goto_0
    iget v1, v0, Lcom/appsflyer/internal/AFk1tSDK;->AFAdRevenueData:I

    .line 38
    .line 39
    array-length v2, p0

    .line 40
    if-ge v1, v2, :cond_1

    .line 41
    .line 42
    sget v2, Lcom/appsflyer/internal/AFd1dSDK;->$11:I

    .line 43
    .line 44
    add-int/lit8 v2, v2, 0x21

    .line 45
    .line 46
    rem-int/lit16 v2, v2, 0x80

    .line 47
    .line 48
    sput v2, Lcom/appsflyer/internal/AFd1dSDK;->$10:I

    .line 49
    .line 50
    add-int/lit8 v2, v1, -0x4

    .line 51
    .line 52
    iput v2, v0, Lcom/appsflyer/internal/AFk1tSDK;->getCurrencyIso4217Code:I

    .line 53
    .line 54
    aget-char v5, p0, v1

    .line 55
    .line 56
    rem-int/lit8 v6, v1, 0x4

    .line 57
    .line 58
    aget-char v6, p0, v6

    .line 59
    .line 60
    xor-int/2addr v5, v6

    .line 61
    int-to-long v5, v5

    .line 62
    int-to-long v7, v2

    .line 63
    sget-wide v9, Lcom/appsflyer/internal/AFd1dSDK;->copydefault:J

    .line 64
    .line 65
    xor-long/2addr v9, v3

    .line 66
    mul-long/2addr v7, v9

    .line 67
    xor-long/2addr v5, v7

    .line 68
    long-to-int v2, v5

    .line 69
    int-to-char v2, v2

    .line 70
    aput-char v2, p0, v1

    .line 71
    .line 72
    add-int/lit8 v1, v1, 0x1

    .line 73
    .line 74
    iput v1, v0, Lcom/appsflyer/internal/AFk1tSDK;->AFAdRevenueData:I

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    new-instance v0, Ljava/lang/String;

    .line 78
    .line 79
    array-length v1, p0

    .line 80
    sub-int/2addr v1, p1

    .line 81
    invoke-direct {v0, p0, p1, v1}, Ljava/lang/String;-><init>([CII)V

    .line 82
    .line 83
    .line 84
    const/4 p0, 0x0

    .line 85
    aput-object v0, p2, p0

    .line 86
    .line 87
    return-void
.end method

.method private final areAllFieldsValid()Ljava/util/concurrent/ExecutorService;
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x3d

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1dSDK;->component3:Lkotlin/Lazy;

    .line 12
    .line 13
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/util/concurrent/ExecutorService;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    throw p0
.end method

.method public static synthetic b(Lcom/appsflyer/internal/AFd1dSDK;Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/appsflyer/internal/AFd1dSDK;->getMonetizationNetwork(Lcom/appsflyer/internal/AFd1dSDK;Ljava/lang/Throwable;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Lcom/appsflyer/internal/AFd1dSDK;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/appsflyer/internal/AFd1dSDK;->getRevenue(Lcom/appsflyer/internal/AFd1dSDK;)V

    return-void
.end method

.method private component1()Lcom/appsflyer/internal/AFd1aSDK;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x9

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1dSDK;->component4:Lkotlin/Lazy;

    .line 12
    .line 13
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/appsflyer/internal/AFd1aSDK;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    throw p0
.end method

.method private final component2()Lcom/appsflyer/internal/AFd1rSDK;
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x67

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData:Lkotlin/Lazy;

    .line 12
    .line 13
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/appsflyer/internal/AFd1rSDK;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/16 v0, 0x3f

    .line 22
    .line 23
    div-int/lit8 v0, v0, 0x0

    .line 24
    .line 25
    :cond_0
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 26
    .line 27
    add-int/lit8 v0, v0, 0x79

    .line 28
    .line 29
    rem-int/lit16 v1, v0, 0x80

    .line 30
    .line 31
    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 32
    .line 33
    rem-int/lit8 v0, v0, 0x2

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    throw p0
.end method

.method private final component3()Lcom/appsflyer/internal/AFh1fSDK;
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x29

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFg1wSDK;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1wSDK;->getRevenue:Lcom/appsflyer/internal/AFg1tSDK;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1tSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFh1aSDK;

    .line 20
    .line 21
    const/16 v0, 0x46

    .line 22
    .line 23
    div-int/lit8 v0, v0, 0x0

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1wSDK;->getRevenue:Lcom/appsflyer/internal/AFg1tSDK;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1tSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFh1aSDK;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    :goto_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFh1aSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFh1bSDK;

    .line 35
    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Lcom/appsflyer/internal/AFh1bSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFh1fSDK;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_1
    sget p0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 42
    .line 43
    add-int/lit8 p0, p0, 0x4f

    .line 44
    .line 45
    rem-int/lit16 p0, p0, 0x80

    .line 46
    .line 47
    sput p0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method private final component4()Lcom/appsflyer/internal/AFg1rSDK;
    .locals 1

    .line 1
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x63

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1dSDK;->getRevenue:Lkotlin/Lazy;

    .line 10
    .line 11
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/appsflyer/internal/AFg1rSDK;

    .line 16
    .line 17
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x3d

    .line 20
    .line 21
    rem-int/lit16 v0, v0, 0x80

    .line 22
    .line 23
    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 24
    .line 25
    return-object p0
.end method

.method private final copy()V
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component3()Lcom/appsflyer/internal/AFh1fSDK;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFd1dSDK;->getRevenue(Lcom/appsflyer/internal/AFh1fSDK;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component4()Lcom/appsflyer/internal/AFg1rSDK;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v1, v1, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const v3, 0x28dad36d

    .line 30
    .line 31
    .line 32
    const v4, -0x28dad36d

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v3, v4, v2}, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ljava/util/Map;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFd1iSDK;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v2}, Lcom/appsflyer/internal/AFd1iSDK;->getRevenue()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {v0, v2}, Lcom/appsflyer/internal/AFd1dSDK;->getMonetizationNetwork(Ljava/util/Map;Ljava/util/List;)Ljava/util/Map;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v2, Lorg/json/JSONObject;

    .line 54
    .line 55
    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    .line 64
    .line 65
    filled-new-array {p0, v0, v1}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    const v1, 0x22076a86

    .line 74
    .line 75
    .line 76
    const v2, -0x22076a84

    .line 77
    .line 78
    .line 79
    invoke-static {v0, v1, v2, p0}, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    sget p0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 83
    .line 84
    add-int/lit8 p0, p0, 0x35

    .line 85
    .line 86
    rem-int/lit16 p0, p0, 0x80

    .line 87
    .line 88
    sput p0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 89
    .line 90
    :cond_0
    return-void

    .line 91
    :cond_1
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 92
    .line 93
    sget-object v1, Lcom/appsflyer/internal/AFg1cSDK;->copydefault:Lcom/appsflyer/internal/AFg1cSDK;

    .line 94
    .line 95
    const/4 v4, 0x4

    .line 96
    const/4 v5, 0x0

    .line 97
    const-string v2, "skipping"

    .line 98
    .line 99
    const/4 v3, 0x0

    .line 100
    invoke-static/range {v0 .. v5}, Lcom/appsflyer/internal/AFh1ySDK;->v$default(Lcom/appsflyer/internal/AFh1ySDK;Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    sget p0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 104
    .line 105
    add-int/lit8 p0, p0, 0x29

    .line 106
    .line 107
    rem-int/lit16 p0, p0, 0x80

    .line 108
    .line 109
    sput p0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 110
    .line 111
    return-void

    .line 112
    :cond_2
    sget p0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 113
    .line 114
    add-int/lit8 p0, p0, 0x61

    .line 115
    .line 116
    rem-int/lit16 p0, p0, 0x80

    .line 117
    .line 118
    sput p0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 119
    .line 120
    return-void
.end method

.method private final declared-synchronized copydefault()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component3()Lcom/appsflyer/internal/AFh1fSDK;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget v1, v0, Lcom/appsflyer/internal/AFh1fSDK;->getMonetizationNetwork:I

    .line 9
    .line 10
    const/4 v2, -0x1

    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component2()Lcom/appsflyer/internal/AFd1rSDK;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "af_send_exc_to_server_window"

    .line 18
    .line 19
    invoke-interface {v1, v2}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    goto :goto_2

    .line 25
    :cond_0
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component2()Lcom/appsflyer/internal/AFd1rSDK;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "af_send_exc_to_server_window"

    .line 30
    .line 31
    const-wide/16 v3, -0x1

    .line 32
    .line 33
    invoke-interface {v1, v2, v3, v4}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;J)J

    .line 34
    .line 35
    .line 36
    move-result-wide v1

    .line 37
    cmp-long v1, v1, v3

    .line 38
    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFh1fSDK;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFh1fSDK;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 50
    .line 51
    add-int/lit8 v0, v0, 0x21

    .line 52
    .line 53
    rem-int/lit16 v0, v0, 0x80

    .line 54
    .line 55
    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    :goto_1
    iget-object v1, p0, Lcom/appsflyer/internal/AFd1dSDK;->component1:Lcom/appsflyer/internal/AFd1bSDK$AFa1ySDK;

    .line 59
    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    sget v2, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 63
    .line 64
    add-int/lit8 v2, v2, 0x29

    .line 65
    .line 66
    rem-int/lit16 v2, v2, 0x80

    .line 67
    .line 68
    sput v2, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 69
    .line 70
    invoke-interface {v1, v0}, Lcom/appsflyer/internal/AFd1bSDK$AFa1ySDK;->onConfigurationChanged(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    .line 72
    .line 73
    monitor-exit p0

    .line 74
    return-void

    .line 75
    :cond_3
    monitor-exit p0

    .line 76
    return-void

    .line 77
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    throw v0
.end method

.method public static synthetic d(Lcom/appsflyer/internal/AFd1dSDK;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFd1dSDK;)V

    return-void
.end method

.method private final declared-synchronized equals()V
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component3()Lcom/appsflyer/internal/AFh1fSDK;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-wide v0, v0, Lcom/appsflyer/internal/AFh1fSDK;->getRevenue:J

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catchall_0
    move-exception v0

    .line 12
    goto/16 :goto_c

    .line 13
    .line 14
    :cond_0
    const-wide/16 v0, -0x1

    .line 15
    .line 16
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    const-wide/16 v4, 0x3e8

    .line 21
    .line 22
    div-long/2addr v2, v4

    .line 23
    cmp-long v0, v0, v2

    .line 24
    .line 25
    if-gez v0, :cond_1

    .line 26
    .line 27
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 28
    .line 29
    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->copydefault:Lcom/appsflyer/internal/AFg1cSDK;

    .line 30
    .line 31
    const-string v3, "TTL is already passed"

    .line 32
    .line 33
    const/4 v5, 0x4

    .line 34
    const/4 v6, 0x0

    .line 35
    const/4 v4, 0x0

    .line 36
    invoke-static/range {v1 .. v6}, Lcom/appsflyer/internal/AFh1ySDK;->v$default(Lcom/appsflyer/internal/AFh1ySDK;Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component2()Lcom/appsflyer/internal/AFd1rSDK;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "af_send_exc_to_server_window"

    .line 44
    .line 45
    invoke-interface {v0, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFd1iSDK;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1iSDK;->getMonetizationNetwork()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    .line 54
    .line 55
    monitor-exit p0

    .line 56
    return-void

    .line 57
    :cond_1
    :try_start_1
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component3()Lcom/appsflyer/internal/AFh1fSDK;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/4 v1, 0x0

    .line 62
    const/4 v2, 0x2

    .line 63
    const/4 v3, 0x0

    .line 64
    if-eqz v0, :cond_f

    .line 65
    .line 66
    sget v4, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 67
    .line 68
    add-int/lit8 v4, v4, 0x31

    .line 69
    .line 70
    rem-int/lit16 v5, v4, 0x80

    .line 71
    .line 72
    sput v5, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 73
    .line 74
    rem-int/2addr v4, v2

    .line 75
    const/4 v5, 0x1

    .line 76
    if-eqz v4, :cond_2

    .line 77
    .line 78
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFd1dSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFh1fSDK;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_f

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFd1dSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFh1fSDK;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-ne v0, v5, :cond_f

    .line 90
    .line 91
    :goto_1
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component3()Lcom/appsflyer/internal/AFh1fSDK;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const/4 v4, -0x1

    .line 96
    if-eqz v0, :cond_7

    .line 97
    .line 98
    iget-object v0, v0, Lcom/appsflyer/internal/AFh1fSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 99
    .line 100
    if-eqz v0, :cond_7

    .line 101
    .line 102
    new-instance v6, Lkotlin/text/Regex;

    .line 103
    .line 104
    const-string v7, "(\\d+).(\\d+).(\\d+).*"

    .line 105
    .line 106
    invoke-direct {v6, v7}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v6, v0}, Lkotlin/text/Regex;->matchEntire(Ljava/lang/CharSequence;)Lkotlin/text/MatchResult;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    if-eqz v0, :cond_6

    .line 114
    .line 115
    invoke-interface {v0}, Lkotlin/text/MatchResult;->b()Lkotlin/text/MatchGroupCollection;

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    invoke-interface {v6, v5}, Lkotlin/text/MatchGroupCollection;->get(I)Lkotlin/text/MatchGroup;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    if-eqz v5, :cond_3

    .line 124
    .line 125
    invoke-virtual {v5}, Lkotlin/text/MatchGroup;->a()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    if-eqz v5, :cond_3

    .line 130
    .line 131
    invoke-static {v5}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    if-eqz v5, :cond_3

    .line 136
    .line 137
    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    .line 138
    .line 139
    .line 140
    move-result v5

    .line 141
    goto :goto_2

    .line 142
    :cond_3
    move v5, v3

    .line 143
    :goto_2
    const v6, 0xf4240

    .line 144
    .line 145
    .line 146
    mul-int/2addr v5, v6

    .line 147
    invoke-interface {v0}, Lkotlin/text/MatchResult;->b()Lkotlin/text/MatchGroupCollection;

    .line 148
    .line 149
    .line 150
    move-result-object v6

    .line 151
    invoke-interface {v6, v2}, Lkotlin/text/MatchGroupCollection;->get(I)Lkotlin/text/MatchGroup;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    if-eqz v6, :cond_4

    .line 156
    .line 157
    invoke-virtual {v6}, Lkotlin/text/MatchGroup;->a()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    if-eqz v6, :cond_4

    .line 162
    .line 163
    invoke-static {v6}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    .line 164
    .line 165
    .line 166
    move-result-object v6

    .line 167
    if-eqz v6, :cond_4

    .line 168
    .line 169
    sget v7, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 170
    .line 171
    add-int/lit8 v7, v7, 0x75

    .line 172
    .line 173
    rem-int/lit16 v7, v7, 0x80

    .line 174
    .line 175
    sput v7, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 176
    .line 177
    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    .line 178
    .line 179
    .line 180
    move-result v6

    .line 181
    goto :goto_3

    .line 182
    :cond_4
    sget v6, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 183
    .line 184
    add-int/lit8 v6, v6, 0x79

    .line 185
    .line 186
    rem-int/lit16 v6, v6, 0x80

    .line 187
    .line 188
    sput v6, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 189
    .line 190
    move v6, v3

    .line 191
    :goto_3
    mul-int/lit16 v6, v6, 0x3e8

    .line 192
    .line 193
    add-int/2addr v5, v6

    .line 194
    invoke-interface {v0}, Lkotlin/text/MatchResult;->b()Lkotlin/text/MatchGroupCollection;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    const/4 v6, 0x3

    .line 199
    invoke-interface {v0, v6}, Lkotlin/text/MatchGroupCollection;->get(I)Lkotlin/text/MatchGroup;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    if-eqz v0, :cond_5

    .line 204
    .line 205
    invoke-virtual {v0}, Lkotlin/text/MatchGroup;->a()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    if-eqz v0, :cond_5

    .line 210
    .line 211
    sget v6, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 212
    .line 213
    add-int/lit8 v6, v6, 0x79

    .line 214
    .line 215
    rem-int/lit16 v6, v6, 0x80

    .line 216
    .line 217
    sput v6, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 218
    .line 219
    invoke-static {v0}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    if-eqz v0, :cond_5

    .line 224
    .line 225
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    goto :goto_4

    .line 230
    :cond_5
    move v0, v3

    .line 231
    :goto_4
    add-int/2addr v5, v0

    .line 232
    goto :goto_5

    .line 233
    :cond_6
    move v5, v4

    .line 234
    :goto_5
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    goto :goto_6

    .line 239
    :cond_7
    move-object v0, v1

    .line 240
    :goto_6
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component3()Lcom/appsflyer/internal/AFh1fSDK;

    .line 241
    .line 242
    .line 243
    move-result-object v5

    .line 244
    if-eqz v5, :cond_8

    .line 245
    .line 246
    sget v6, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 247
    .line 248
    add-int/lit8 v6, v6, 0x19

    .line 249
    .line 250
    rem-int/lit16 v6, v6, 0x80

    .line 251
    .line 252
    sput v6, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 253
    .line 254
    iget-object v5, v5, Lcom/appsflyer/internal/AFh1fSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 255
    .line 256
    if-eqz v5, :cond_8

    .line 257
    .line 258
    invoke-static {v5}, Lcom/appsflyer/internal/AFe1ySDK;->AFAdRevenueData(Ljava/lang/String;)Lkotlin/Pair;

    .line 259
    .line 260
    .line 261
    move-result-object v5

    .line 262
    goto :goto_7

    .line 263
    :cond_8
    move-object v5, v1

    .line 264
    :goto_7
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component3()Lcom/appsflyer/internal/AFh1fSDK;

    .line 265
    .line 266
    .line 267
    move-result-object v6

    .line 268
    if-eqz v6, :cond_9

    .line 269
    .line 270
    sget v7, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 271
    .line 272
    add-int/lit8 v7, v7, 0x43

    .line 273
    .line 274
    rem-int/lit16 v7, v7, 0x80

    .line 275
    .line 276
    sput v7, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 277
    .line 278
    iget-object v6, v6, Lcom/appsflyer/internal/AFh1fSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 279
    .line 280
    if-eqz v6, :cond_9

    .line 281
    .line 282
    invoke-static {v6}, Lcom/appsflyer/internal/AFe1ySDK;->getRevenue(Ljava/lang/String;)Lkotlin/Pair;

    .line 283
    .line 284
    .line 285
    move-result-object v6

    .line 286
    goto :goto_8

    .line 287
    :cond_9
    move-object v6, v1

    .line 288
    :goto_8
    if-nez v0, :cond_a

    .line 289
    .line 290
    goto :goto_9

    .line 291
    :cond_a
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 292
    .line 293
    .line 294
    move-result v0

    .line 295
    if-eq v0, v4, :cond_b

    .line 296
    .line 297
    :goto_9
    if-nez v5, :cond_b

    .line 298
    .line 299
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFd1iSDK;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    iget-object v4, p0, Lcom/appsflyer/internal/AFd1dSDK;->component2:Ljava/lang/String;

    .line 304
    .line 305
    filled-new-array {v4}, [Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v4

    .line 309
    invoke-interface {v0, v4}, Lcom/appsflyer/internal/AFd1iSDK;->getMediationNetwork([Ljava/lang/String;)Z

    .line 310
    .line 311
    .line 312
    goto/16 :goto_a

    .line 313
    .line 314
    :cond_b
    if-eqz v5, :cond_c

    .line 315
    .line 316
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 317
    .line 318
    add-int/lit8 v0, v0, 0x5d

    .line 319
    .line 320
    rem-int/lit16 v0, v0, 0x80

    .line 321
    .line 322
    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 323
    .line 324
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFd1iSDK;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-virtual {v5}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v4

    .line 332
    check-cast v4, Ljava/lang/Number;

    .line 333
    .line 334
    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    .line 335
    .line 336
    .line 337
    move-result v4

    .line 338
    invoke-virtual {v5}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    move-result-object v5

    .line 342
    check-cast v5, Ljava/lang/Number;

    .line 343
    .line 344
    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    .line 345
    .line 346
    .line 347
    move-result v5

    .line 348
    invoke-interface {v0, v4, v5}, Lcom/appsflyer/internal/AFd1iSDK;->getCurrencyIso4217Code(II)V

    .line 349
    .line 350
    .line 351
    goto :goto_a

    .line 352
    :cond_c
    if-eqz v6, :cond_e

    .line 353
    .line 354
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 355
    .line 356
    add-int/lit8 v0, v0, 0x7b

    .line 357
    .line 358
    rem-int/lit16 v4, v0, 0x80

    .line 359
    .line 360
    sput v4, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 361
    .line 362
    rem-int/2addr v0, v2

    .line 363
    if-nez v0, :cond_d

    .line 364
    .line 365
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFd1iSDK;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    invoke-virtual {v6}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 370
    .line 371
    .line 372
    move-result-object v4

    .line 373
    check-cast v4, Ljava/lang/Number;

    .line 374
    .line 375
    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    .line 376
    .line 377
    .line 378
    move-result v4

    .line 379
    invoke-virtual {v6}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 380
    .line 381
    .line 382
    move-result-object v5

    .line 383
    check-cast v5, Ljava/lang/Number;

    .line 384
    .line 385
    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    .line 386
    .line 387
    .line 388
    move-result v5

    .line 389
    invoke-interface {v0, v4, v5}, Lcom/appsflyer/internal/AFd1iSDK;->getCurrencyIso4217Code(II)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 390
    .line 391
    .line 392
    const/16 v0, 0x1b

    .line 393
    .line 394
    :try_start_2
    div-int/2addr v0, v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 395
    goto :goto_a

    .line 396
    :catchall_1
    move-exception v0

    .line 397
    :try_start_3
    throw v0

    .line 398
    :cond_d
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFd1iSDK;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    invoke-virtual {v6}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 403
    .line 404
    .line 405
    move-result-object v4

    .line 406
    check-cast v4, Ljava/lang/Number;

    .line 407
    .line 408
    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    .line 409
    .line 410
    .line 411
    move-result v4

    .line 412
    invoke-virtual {v6}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 413
    .line 414
    .line 415
    move-result-object v5

    .line 416
    check-cast v5, Ljava/lang/Number;

    .line 417
    .line 418
    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    .line 419
    .line 420
    .line 421
    move-result v5

    .line 422
    invoke-interface {v0, v4, v5}, Lcom/appsflyer/internal/AFd1iSDK;->getCurrencyIso4217Code(II)V

    .line 423
    .line 424
    .line 425
    goto :goto_a

    .line 426
    :cond_e
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component2()Lcom/appsflyer/internal/AFd1rSDK;

    .line 427
    .line 428
    .line 429
    move-result-object v0

    .line 430
    const-string v4, "af_send_exc_to_server_window"

    .line 431
    .line 432
    invoke-interface {v0, v4}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;)V

    .line 433
    .line 434
    .line 435
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFd1iSDK;

    .line 436
    .line 437
    .line 438
    move-result-object v0

    .line 439
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1iSDK;->getMonetizationNetwork()Z

    .line 440
    .line 441
    .line 442
    goto :goto_a

    .line 443
    :cond_f
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component2()Lcom/appsflyer/internal/AFd1rSDK;

    .line 444
    .line 445
    .line 446
    move-result-object v0

    .line 447
    const-string v4, "af_send_exc_to_server_window"

    .line 448
    .line 449
    invoke-interface {v0, v4}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;)V

    .line 450
    .line 451
    .line 452
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFd1iSDK;

    .line 453
    .line 454
    .line 455
    move-result-object v0

    .line 456
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1iSDK;->getMonetizationNetwork()Z

    .line 457
    .line 458
    .line 459
    :goto_a
    iget-object v0, p0, Lcom/appsflyer/internal/AFd1dSDK;->component1:Lcom/appsflyer/internal/AFd1bSDK$AFa1ySDK;

    .line 460
    .line 461
    if-eqz v0, :cond_12

    .line 462
    .line 463
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component3()Lcom/appsflyer/internal/AFh1fSDK;

    .line 464
    .line 465
    .line 466
    move-result-object v4

    .line 467
    if-eqz v4, :cond_11

    .line 468
    .line 469
    sget v3, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 470
    .line 471
    add-int/lit8 v3, v3, 0x63

    .line 472
    .line 473
    rem-int/lit16 v5, v3, 0x80

    .line 474
    .line 475
    sput v5, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 476
    .line 477
    rem-int/2addr v3, v2

    .line 478
    if-eqz v3, :cond_10

    .line 479
    .line 480
    invoke-direct {p0, v4}, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFh1fSDK;)Z

    .line 481
    .line 482
    .line 483
    move-result v3

    .line 484
    goto :goto_b

    .line 485
    :cond_10
    invoke-direct {p0, v4}, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFh1fSDK;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 486
    .line 487
    .line 488
    :try_start_4
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 489
    :cond_11
    :goto_b
    :try_start_5
    invoke-interface {v0, v3}, Lcom/appsflyer/internal/AFd1bSDK$AFa1ySDK;->onConfigurationChanged(Z)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 490
    .line 491
    .line 492
    monitor-exit p0

    .line 493
    return-void

    .line 494
    :cond_12
    monitor-exit p0

    .line 495
    return-void

    .line 496
    :goto_c
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 497
    throw v0
.end method

.method private static synthetic getCurrencyIso4217Code([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    const/4 v0, 0x0

    aget-object v0, p0, v0

    check-cast v0, Lcom/appsflyer/internal/AFd1dSDK;

    const/4 v1, 0x1

    aget-object v1, p0, v1

    check-cast v1, Ljava/lang/String;

    const/4 v2, 0x2

    aget-object p0, p0, v2

    check-cast p0, Ljava/lang/String;

    .line 119
    sget v3, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    add-int/lit8 v3, v3, 0x43

    rem-int/lit16 v3, v3, 0x80

    sput v3, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 120
    sget-object v3, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 121
    invoke-static {v1, p0}, Lcom/appsflyer/internal/AFb1iSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 122
    const-string v1, "Authorization"

    invoke-static {v1, p0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p0

    .line 123
    invoke-direct {v0}, Lcom/appsflyer/internal/AFd1dSDK;->component1()Lcom/appsflyer/internal/AFd1aSDK;

    move-result-object v0

    const/16 v1, 0x7d0

    .line 124
    invoke-interface {v0, v3, p0, v1}, Lcom/appsflyer/internal/AFd1aSDK;->AFAdRevenueData([BLjava/util/Map;I)V

    .line 125
    sget p0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 p0, p0, 0x4b

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    rem-int/2addr p0, v2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    throw v0
.end method

.method public static synthetic getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;
    .locals 3

    .line 1
    mul-int/lit16 v0, p1, -0x208

    .line 2
    .line 3
    mul-int/lit16 v1, p2, 0x20a

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    not-int v1, p1

    .line 7
    or-int v2, v1, p2

    .line 8
    .line 9
    or-int/2addr v2, p3

    .line 10
    not-int v2, v2

    .line 11
    mul-int/lit16 v2, v2, 0x209

    .line 12
    .line 13
    add-int/2addr v0, v2

    .line 14
    not-int v2, p2

    .line 15
    or-int/2addr p1, v2

    .line 16
    not-int p1, p1

    .line 17
    mul-int/lit16 v2, p1, -0x412

    .line 18
    .line 19
    add-int/2addr v0, v2

    .line 20
    not-int p3, p3

    .line 21
    or-int/2addr p3, v1

    .line 22
    or-int/2addr p2, p3

    .line 23
    not-int p2, p2

    .line 24
    or-int/2addr p1, p2

    .line 25
    mul-int/lit16 p1, p1, 0x209

    .line 26
    .line 27
    add-int/2addr v0, p1

    .line 28
    const/4 p1, 0x1

    .line 29
    if-eq v0, p1, :cond_3

    .line 30
    .line 31
    const/4 p2, 0x2

    .line 32
    if-eq v0, p2, :cond_2

    .line 33
    .line 34
    const/4 p3, 0x3

    .line 35
    if-eq v0, p3, :cond_1

    .line 36
    .line 37
    const/4 p1, 0x4

    .line 38
    if-eq v0, p1, :cond_0

    .line 39
    .line 40
    invoke-static {p0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData([Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_0
    invoke-static {p0}, Lcom/appsflyer/internal/AFd1dSDK;->getMonetizationNetwork([Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    const/4 p3, 0x0

    .line 51
    aget-object p3, p0, p3

    .line 52
    .line 53
    check-cast p3, Lcom/appsflyer/internal/AFd1dSDK;

    .line 54
    .line 55
    aget-object p1, p0, p1

    .line 56
    .line 57
    check-cast p1, Ljava/lang/Throwable;

    .line 58
    .line 59
    aget-object p0, p0, p2

    .line 60
    .line 61
    check-cast p0, Ljava/lang/String;

    .line 62
    .line 63
    sget p2, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 64
    .line 65
    add-int/lit8 p2, p2, 0x23

    .line 66
    .line 67
    rem-int/lit16 p2, p2, 0x80

    .line 68
    .line 69
    sput p2, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    invoke-direct {p3}, Lcom/appsflyer/internal/AFd1dSDK;->areAllFieldsValid()Ljava/util/concurrent/ExecutorService;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    new-instance v0, Lcom/appsflyer/internal/j;

    .line 82
    .line 83
    invoke-direct {v0, p3, p1, p0}, Lcom/appsflyer/internal/j;-><init>(Lcom/appsflyer/internal/AFd1dSDK;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 87
    .line 88
    .line 89
    sget p0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 90
    .line 91
    add-int/lit8 p0, p0, 0x1b

    .line 92
    .line 93
    rem-int/lit16 p0, p0, 0x80

    .line 94
    .line 95
    sput p0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 96
    .line 97
    const/4 p0, 0x0

    .line 98
    return-object p0

    .line 99
    :cond_2
    invoke-static {p0}, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code([Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0

    .line 104
    :cond_3
    invoke-static {p0}, Lcom/appsflyer/internal/AFd1dSDK;->getMediationNetwork([Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0
.end method

.method private final getCurrencyIso4217Code(Lcom/appsflyer/internal/AFh1fSDK;)Z
    .locals 10

    .line 126
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x59

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 127
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 128
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component2()Lcom/appsflyer/internal/AFd1rSDK;

    move-result-object v2

    const-string v3, "af_send_exc_to_server_window"

    const-wide/16 v4, -0x1

    invoke-interface {v2, v3, v4, v5}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;J)J

    move-result-wide v2

    .line 129
    iget-wide v6, p1, Lcom/appsflyer/internal/AFh1fSDK;->getRevenue:J

    const-wide/16 v8, 0x3e8

    .line 130
    div-long v8, v0, v8

    cmp-long v6, v6, v8

    const/4 v7, 0x0

    if-gez v6, :cond_0

    return v7

    :cond_0
    cmp-long v4, v2, v4

    if-eqz v4, :cond_3

    sget v4, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 v4, v4, 0x13

    rem-int/lit16 v5, v4, 0x80

    sput v5, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    rem-int/lit8 v4, v4, 0x2

    if-nez v4, :cond_2

    cmp-long v0, v2, v0

    if-gez v0, :cond_1

    goto :goto_0

    .line 131
    :cond_1
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFd1dSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFh1fSDK;)Z

    move-result p0

    return p0

    :cond_2
    const/4 p0, 0x0

    .line 132
    throw p0

    :cond_3
    :goto_0
    return v7
.end method

.method public static final synthetic getMediationNetwork(Lcom/appsflyer/internal/AFd1dSDK;)Lcom/appsflyer/internal/AFd1fSDK;
    .locals 3

    .line 40
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-int v0, v0

    const v1, 0x292a5035

    const v2, -0x292a5034

    invoke-static {p0, v1, v2, v0}, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/internal/AFd1fSDK;

    return-object p0
.end method

.method private final getMediationNetwork()Lcom/appsflyer/internal/AFg1wSDK;
    .locals 2

    .line 36
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 v0, v0, 0x27

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    rem-int/lit8 v0, v0, 0x2

    iget-object p0, p0, Lcom/appsflyer/internal/AFd1dSDK;->getMonetizationNetwork:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/internal/AFg1wSDK;

    if-nez v0, :cond_0

    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 v0, v0, 0x9

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    return-object p0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method private static synthetic getMediationNetwork([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p0, p0, v0

    .line 3
    .line 4
    check-cast p0, Lcom/appsflyer/internal/AFd1dSDK;

    .line 5
    .line 6
    sget v1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 7
    .line 8
    add-int/lit8 v2, v1, 0x51

    .line 9
    .line 10
    rem-int/lit16 v3, v2, 0x80

    .line 11
    .line 12
    sput v3, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 13
    .line 14
    rem-int/lit8 v2, v2, 0x2

    .line 15
    .line 16
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1fSDK;

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x17

    .line 21
    .line 22
    rem-int/lit16 v2, v1, 0x80

    .line 23
    .line 24
    sput v2, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 25
    .line 26
    rem-int/lit8 v1, v1, 0x2

    .line 27
    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    const/16 v1, 0x46

    .line 31
    .line 32
    div-int/2addr v1, v0

    .line 33
    :cond_0
    return-object p0

    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    throw p0
.end method

.method private final getMediationNetwork(Lcom/appsflyer/internal/AFh1fSDK;)Z
    .locals 1

    .line 37
    new-instance v0, Lcom/appsflyer/internal/AFe1zSDK;

    invoke-direct {v0}, Lcom/appsflyer/internal/AFe1zSDK;-><init>()V

    iget-object p0, p0, Lcom/appsflyer/internal/AFd1dSDK;->component2:Ljava/lang/String;

    .line 38
    iget-object p1, p1, Lcom/appsflyer/internal/AFh1fSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 39
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0, p1}, Lcom/appsflyer/internal/AFe1zSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    sget p1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    add-int/lit8 p1, p1, 0x2b

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    return p0
.end method

.method private static synthetic getMonetizationNetwork([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v0, p0, v0

    .line 3
    .line 4
    check-cast v0, Lcom/appsflyer/internal/AFd1dSDK;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget-object p0, p0, v1

    .line 8
    .line 9
    check-cast p0, Lcom/appsflyer/internal/AFh1fSDK;

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-direct {v0}, Lcom/appsflyer/internal/AFd1dSDK;->component2()Lcom/appsflyer/internal/AFd1rSDK;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const-string v4, "af_send_exc_to_server_window"

    .line 20
    .line 21
    const-wide/16 v5, -0x1

    .line 22
    .line 23
    invoke-interface {v3, v4, v5, v6}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;J)J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    iget-wide v7, p0, Lcom/appsflyer/internal/AFh1fSDK;->getRevenue:J

    .line 28
    .line 29
    const-wide/16 v9, 0x3e8

    .line 30
    .line 31
    div-long v9, v1, v9

    .line 32
    .line 33
    cmp-long v7, v7, v9

    .line 34
    .line 35
    if-gez v7, :cond_0

    .line 36
    .line 37
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_0
    cmp-long v5, v3, v5

    .line 41
    .line 42
    if-eqz v5, :cond_5

    .line 43
    .line 44
    sget v5, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 45
    .line 46
    add-int/lit8 v5, v5, 0x45

    .line 47
    .line 48
    rem-int/lit16 v5, v5, 0x80

    .line 49
    .line 50
    sput v5, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 51
    .line 52
    cmp-long v1, v3, v1

    .line 53
    .line 54
    if-gez v1, :cond_1

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    invoke-direct {v0}, Lcom/appsflyer/internal/AFd1dSDK;->component2()Lcom/appsflyer/internal/AFd1rSDK;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-string v2, "af_send_exc_min"

    .line 62
    .line 63
    const/4 v3, -0x1

    .line 64
    invoke-interface {v1, v2, v3}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eq v1, v3, :cond_4

    .line 69
    .line 70
    sget v2, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 71
    .line 72
    add-int/lit8 v2, v2, 0x7d

    .line 73
    .line 74
    rem-int/lit16 v3, v2, 0x80

    .line 75
    .line 76
    sput v3, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 77
    .line 78
    rem-int/lit8 v2, v2, 0x2

    .line 79
    .line 80
    if-eqz v2, :cond_3

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFd1iSDK;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-interface {v2}, Lcom/appsflyer/internal/AFd1iSDK;->AFAdRevenueData()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-ge v2, v1, :cond_2

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    invoke-direct {v0, p0}, Lcom/appsflyer/internal/AFd1dSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFh1fSDK;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0

    .line 102
    :cond_3
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFd1iSDK;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1iSDK;->AFAdRevenueData()I

    .line 107
    .line 108
    .line 109
    const/4 p0, 0x0

    .line 110
    throw p0

    .line 111
    :cond_4
    :goto_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 112
    .line 113
    return-object p0

    .line 114
    :cond_5
    :goto_1
    sget p0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 115
    .line 116
    add-int/lit8 p0, p0, 0x1d

    .line 117
    .line 118
    rem-int/lit16 p0, p0, 0x80

    .line 119
    .line 120
    sput p0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 121
    .line 122
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 123
    .line 124
    return-object p0
.end method

.method private final getMonetizationNetwork(Lcom/appsflyer/internal/AFh1fSDK;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/AFh1fSDK;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 138
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v0, 0x28dad36d

    const v1, -0x28dad36d

    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    return-object p0
.end method

.method private static getMonetizationNetwork(Ljava/util/Map;Ljava/util/List;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/List<",
            "Lcom/appsflyer/internal/AFd1gSDK;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 132
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x69

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    const-string v0, "deviceInfo"

    invoke-static {v0, p0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p0

    const-string v0, "excs"

    invoke-static {p1}, Lcom/appsflyer/internal/AFe1vSDK;->getMonetizationNetwork(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-static {v0, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    filled-new-array {p0, p1}, [Lkotlin/Pair;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p0

    sget p1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    add-int/lit8 p1, p1, 0x13

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    return-object p0
.end method

.method private static final getMonetizationNetwork(Lcom/appsflyer/internal/AFd1dSDK;)V
    .locals 1

    .line 128
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 v0, v0, 0xd

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 129
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->copydefault()V

    .line 131
    sget p0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 p0, p0, 0x61

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_0

    return-void

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method private static final getMonetizationNetwork(Lcom/appsflyer/internal/AFd1dSDK;Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 2

    .line 133
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->component3()Lcom/appsflyer/internal/AFh1fSDK;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFh1fSDK;)Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 135
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x7d

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 v0, v0, 0x13

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    .line 136
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFd1iSDK;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Lcom/appsflyer/internal/AFd1iSDK;->getMonetizationNetwork(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/lang/String;

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1dSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFd1iSDK;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Lcom/appsflyer/internal/AFd1iSDK;->getMonetizationNetwork(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/lang/String;

    const/4 p0, 0x0

    .line 137
    throw p0

    :cond_1
    sget p0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 p0, p0, 0x51

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    :cond_2
    return-void
.end method

.method private final getRevenue()Lcom/appsflyer/internal/AFd1pSDK;
    .locals 2

    .line 39
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x47

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    iget-object p0, p0, Lcom/appsflyer/internal/AFd1dSDK;->getMediationNetwork:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/internal/AFd1pSDK;

    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 v0, v0, 0x5d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method private static final getRevenue(Lcom/appsflyer/internal/AFd1dSDK;)V
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x7

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->equals()V

    .line 17
    .line 18
    .line 19
    const/16 p0, 0x35

    .line 20
    .line 21
    div-int/lit8 p0, p0, 0x0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->equals()V

    .line 28
    .line 29
    .line 30
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 31
    .line 32
    add-int/lit8 p0, p0, 0x31

    .line 33
    .line 34
    rem-int/lit16 p0, p0, 0x80

    .line 35
    .line 36
    sput p0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    .line 37
    .line 38
    return-void
.end method

.method private final getRevenue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 41
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const p2, 0x22076a86

    const v0, -0x22076a84

    invoke-static {p1, p2, v0, p0}, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method private final getRevenue(Lcom/appsflyer/internal/AFh1fSDK;)Z
    .locals 2

    .line 40
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v0, 0x4237efd8

    const v1, -0x4237efd4

    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final AFAdRevenueData()Lcom/appsflyer/internal/AFd1iSDK;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 164
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 v0, v0, 0x9

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    rem-int/lit8 v0, v0, 0x2

    iget-object p0, p0, Lcom/appsflyer/internal/AFd1dSDK;->areAllFieldsValid:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/internal/AFd1iSDK;

    if-nez v0, :cond_1

    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 v0, v0, 0x65

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/16 v0, 0x23

    div-int/lit8 v0, v0, 0x0

    :cond_0
    return-object p0

    :cond_1
    const/4 p0, 0x0

    throw p0
.end method

.method public final AFAdRevenueData(Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 165
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const p2, -0x18fb4f30

    const v0, 0x18fb4f33

    invoke-static {p1, p2, v0, p0}, Lcom/appsflyer/internal/AFd1dSDK;->getCurrencyIso4217Code([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method public final getCurrencyIso4217Code()V
    .locals 2

    .line 116
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x2d

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    .line 117
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->areAllFieldsValid()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/appsflyer/internal/i;

    invoke-direct {v1, p0}, Lcom/appsflyer/internal/i;-><init>(Lcom/appsflyer/internal/AFd1dSDK;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 118
    sget p0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 p0, p0, 0x9

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    div-int/lit8 p0, p0, 0x0

    :cond_0
    return-void
.end method

.method public final getCurrencyIso4217Code(Lcom/appsflyer/internal/AFd1bSDK$AFa1ySDK;)V
    .locals 2
    .param p1    # Lcom/appsflyer/internal/AFd1bSDK$AFa1ySDK;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 109
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 v0, v0, 0x4b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    .line 110
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1dSDK;->component1:Lcom/appsflyer/internal/AFd1bSDK$AFa1ySDK;

    .line 111
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->areAllFieldsValid()Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    new-instance v0, Lcom/appsflyer/internal/l;

    invoke-direct {v0, p0}, Lcom/appsflyer/internal/l;-><init>(Lcom/appsflyer/internal/AFd1dSDK;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 112
    sget p0, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    add-int/lit8 p0, p0, 0x3

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    return-void

    .line 113
    :cond_0
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1dSDK;->component1:Lcom/appsflyer/internal/AFd1bSDK$AFa1ySDK;

    .line 114
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->areAllFieldsValid()Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    new-instance v0, Lcom/appsflyer/internal/l;

    invoke-direct {v0, p0}, Lcom/appsflyer/internal/l;-><init>(Lcom/appsflyer/internal/AFd1dSDK;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    const/4 p0, 0x0

    .line 115
    throw p0
.end method

.method public final getMonetizationNetwork()V
    .locals 2

    .line 125
    sget v0, Lcom/appsflyer/internal/AFd1dSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x1b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFd1dSDK;->equals:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    .line 126
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->areAllFieldsValid()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/appsflyer/internal/k;

    invoke-direct {v1, p0}, Lcom/appsflyer/internal/k;-><init>(Lcom/appsflyer/internal/AFd1dSDK;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1dSDK;->areAllFieldsValid()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/appsflyer/internal/k;

    invoke-direct {v1, p0}, Lcom/appsflyer/internal/k;-><init>(Lcom/appsflyer/internal/AFd1dSDK;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    const/4 p0, 0x0

    .line 127
    throw p0
.end method
