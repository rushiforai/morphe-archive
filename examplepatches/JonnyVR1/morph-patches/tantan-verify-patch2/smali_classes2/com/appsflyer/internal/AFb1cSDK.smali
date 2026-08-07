.class public final Lcom/appsflyer/internal/AFb1cSDK;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/internal/AFb1bSDK;


# static fields
.field private static $10:I = 0x0

.field private static $11:I = 0x1

.field private static component2:C = '\u0000'

.field private static component3:C = '\u0000'

.field private static copy:C = '\u0000'

.field private static equals:I = 0x0

.field private static final getMediationNetwork:I

.field private static hashCode:I = 0x1

.field private static toString:C


# instance fields
.field private AFAdRevenueData:Z

.field private areAllFieldsValid:Z

.field private final component1:Lcom/appsflyer/internal/AFd1fSDK;

.field private component4:Z

.field private final getCurrencyIso4217Code:Ljava/util/Map;
    .annotation build Landroidx/annotation/NonNull;
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

.field private getMonetizationNetwork:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private getRevenue:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/appsflyer/internal/AFb1cSDK;->areAllFieldsValid()V

    .line 2
    .line 3
    .line 4
    const v0, 0x17f76

    .line 5
    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->getMediationNetwork:I

    .line 8
    .line 9
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 10
    .line 11
    add-int/lit8 v0, v0, 0x55

    .line 12
    .line 13
    rem-int/lit16 v1, v0, 0x80

    .line 14
    .line 15
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 16
    .line 17
    rem-int/lit8 v0, v0, 0x2

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    throw v0
.end method

.method public constructor <init>(Lcom/appsflyer/internal/AFd1fSDK;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->AFAdRevenueData:Z

    .line 13
    .line 14
    new-instance v1, Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 20
    .line 21
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "disableProxy"

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-virtual {v1, v2, v3}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    xor-int/2addr v0, v1

    .line 33
    iput-boolean v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->component4:Z

    .line 34
    .line 35
    iput v3, p0, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue:I

    .line 36
    .line 37
    iput-boolean v3, p0, Lcom/appsflyer/internal/AFb1cSDK;->areAllFieldsValid:Z

    .line 38
    .line 39
    iput-object p1, p0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    .line 40
    .line 41
    return-void
.end method

.method private declared-synchronized AFAdRevenueData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 3
    .line 4
    const-string v1, "\u5a79\u74b8\u724d\u6c32\uc365\ufacb"

    .line 5
    .line 6
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollBarSize()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    shr-int/lit8 v2, v2, 0x8

    .line 11
    .line 12
    rsub-int/lit8 v2, v2, 0x5

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    new-array v3, v3, [Ljava/lang/Object;

    .line 16
    .line 17
    invoke-static {v1, v2, v3}, Lcom/appsflyer/internal/AFb1cSDK;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    aget-object v2, v3, v1

    .line 22
    .line 23
    check-cast v2, Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    sget-object v3, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 30
    .line 31
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 35
    .line 36
    const-string v2, "model"

    .line 37
    .line 38
    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 39
    .line 40
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 44
    .line 45
    const-string v2, "platform"

    .line 46
    .line 47
    const-string v3, "Android"

    .line 48
    .line 49
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 53
    .line 54
    const-string v2, "platform_version"

    .line 55
    .line 56
    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 57
    .line 58
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 59
    .line 60
    .line 61
    if-eqz p1, :cond_0

    .line 62
    .line 63
    :try_start_1
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 64
    .line 65
    add-int/lit8 v0, v0, 0x1d

    .line 66
    .line 67
    rem-int/lit16 v0, v0, 0x80

    .line 68
    .line 69
    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    .line 71
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-lez v0, :cond_0

    .line 76
    .line 77
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 78
    .line 79
    const-string v2, "advertiserId"

    .line 80
    .line 81
    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :catchall_0
    move-exception p1

    .line 86
    goto :goto_2

    .line 87
    :cond_0
    :goto_0
    if-eqz p2, :cond_1

    .line 88
    .line 89
    :try_start_3
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 90
    .line 91
    add-int/lit8 p1, p1, 0x2b

    .line 92
    .line 93
    rem-int/lit16 p1, p1, 0x80

    .line 94
    .line 95
    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 96
    .line 97
    :try_start_4
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 98
    .line 99
    .line 100
    move-result p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 101
    if-lez p1, :cond_1

    .line 102
    .line 103
    :try_start_5
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 104
    .line 105
    add-int/lit8 p1, p1, 0x3f

    .line 106
    .line 107
    rem-int/lit16 p1, p1, 0x80

    .line 108
    .line 109
    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 110
    .line 111
    :try_start_6
    iget-object p1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 112
    .line 113
    const-string v0, "imei"

    .line 114
    .line 115
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    :cond_1
    if-eqz p3, :cond_3

    .line 119
    .line 120
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 121
    .line 122
    .line 123
    move-result p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 124
    if-lez p1, :cond_3

    .line 125
    .line 126
    :try_start_7
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 127
    .line 128
    add-int/lit8 p1, p1, 0x6f

    .line 129
    .line 130
    rem-int/lit16 p2, p1, 0x80

    .line 131
    .line 132
    sput p2, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 133
    .line 134
    rem-int/lit8 p1, p1, 0x2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 135
    .line 136
    iget-object p2, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 137
    .line 138
    if-nez p1, :cond_2

    .line 139
    .line 140
    :try_start_8
    const-string p1, "android_id"

    .line 141
    .line 142
    invoke-interface {p2, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    const/16 p1, 0x57

    .line 146
    .line 147
    div-int/2addr p1, v1

    .line 148
    goto :goto_1

    .line 149
    :cond_2
    const-string p1, "android_id"

    .line 150
    .line 151
    invoke-interface {p2, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 152
    .line 153
    .line 154
    :goto_1
    :try_start_9
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 155
    .line 156
    add-int/lit8 p1, p1, 0x7

    .line 157
    .line 158
    rem-int/lit16 p1, p1, 0x80

    .line 159
    .line 160
    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 161
    .line 162
    goto :goto_3

    .line 163
    :goto_2
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 164
    throw p1

    .line 165
    :cond_3
    :goto_3
    monitor-exit p0

    .line 166
    return-void

    .line 167
    :catchall_1
    monitor-exit p0

    .line 168
    return-void
.end method

.method private declared-synchronized AFAdRevenueData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    monitor-enter p0

    .line 177
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    const-string v1, "sdk_version"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p2, :cond_0

    .line 178
    :try_start_1
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 p1, p1, 0x21

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 179
    :try_start_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_0

    .line 180
    iget-object p1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    const-string v0, "devkey"

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :cond_0
    :goto_0
    if-eqz p3, :cond_2

    .line 181
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-lez p1, :cond_2

    .line 182
    :try_start_3
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p1, p1, 0x35

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    rem-int/lit8 p1, p1, 0x2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 183
    iget-object p2, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    if-nez p1, :cond_1

    :try_start_4
    const-string p1, "originalAppsFlyerId"

    invoke-interface {p2, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_1
    const-string p1, "originalAppsFlyerId"

    invoke-interface {p2, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x0

    .line 184
    throw p1

    :cond_2
    :goto_1
    if-eqz p4, :cond_3

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_3

    .line 185
    iget-object p1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    const-string p2, "uid"

    invoke-interface {p1, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 186
    :try_start_5
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p1, p1, 0x7d

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    goto :goto_3

    :goto_2
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw p1

    .line 187
    :cond_3
    :goto_3
    monitor-exit p0

    return-void

    .line 188
    :catchall_1
    monitor-exit p0

    return-void
.end method

.method private AFAdRevenueData(Z)V
    .locals 2

    .line 192
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v0, -0x2ae7ebae

    const v1, 0x2ae7ebaf

    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method private static AFAdRevenueData(F)Z
    .locals 6

    float-to-double v0, p0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpl-double v2, v0, v2

    const/4 v3, 0x1

    if-ltz v2, :cond_0

    .line 189
    sget p0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p0, p0, 0x6b

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    return v3

    :cond_0
    const-wide/16 v4, 0x0

    cmpg-double v0, v0, v4

    const/4 v1, 0x0

    if-gtz v0, :cond_2

    .line 190
    sget p0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p0, p0, 0x61

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_1

    return v3

    :cond_1
    return v1

    .line 191
    :cond_2
    invoke-static {}, Lcom/appsflyer/internal/AFb1cSDK;->component4()F

    move-result v0

    cmpg-float p0, v0, p0

    if-gtz p0, :cond_3

    return v3

    :cond_3
    return v1
.end method

.method private AFInAppEventType()Z
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x47

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    .line 12
    .line 13
    const-string v1, "participantInProxy"

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0, v1}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    const/16 v0, 0x20

    .line 26
    .line 27
    div-int/lit8 v0, v0, 0x0

    .line 28
    .line 29
    :cond_0
    return p0
.end method

.method private static a(Ljava/lang/String;I[Ljava/lang/Object;)V
    .locals 17

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->$11:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x65

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->$10:I

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->toCharArray()[C

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/appsflyer/internal/AFb1cSDK;->$10:I

    .line 16
    .line 17
    add-int/lit8 v1, v1, 0xb

    .line 18
    .line 19
    rem-int/lit16 v1, v1, 0x80

    .line 20
    .line 21
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->$11:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move-object/from16 v0, p0

    .line 25
    .line 26
    :goto_0
    check-cast v0, [C

    .line 27
    .line 28
    new-instance v1, Lcom/appsflyer/internal/AFj1aSDK;

    .line 29
    .line 30
    invoke-direct {v1}, Lcom/appsflyer/internal/AFj1aSDK;-><init>()V

    .line 31
    .line 32
    .line 33
    array-length v2, v0

    .line 34
    new-array v2, v2, [C

    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    iput v3, v1, Lcom/appsflyer/internal/AFj1aSDK;->getCurrencyIso4217Code:I

    .line 38
    .line 39
    const/4 v4, 0x2

    .line 40
    new-array v5, v4, [C

    .line 41
    .line 42
    :goto_1
    iget v6, v1, Lcom/appsflyer/internal/AFj1aSDK;->getCurrencyIso4217Code:I

    .line 43
    .line 44
    array-length v7, v0

    .line 45
    if-ge v6, v7, :cond_2

    .line 46
    .line 47
    aget-char v7, v0, v6

    .line 48
    .line 49
    aput-char v7, v5, v3

    .line 50
    .line 51
    add-int/lit8 v6, v6, 0x1

    .line 52
    .line 53
    aget-char v6, v0, v6

    .line 54
    .line 55
    const/4 v7, 0x1

    .line 56
    aput-char v6, v5, v7

    .line 57
    .line 58
    const v6, 0xe370

    .line 59
    .line 60
    .line 61
    move v8, v3

    .line 62
    :goto_2
    const/16 v9, 0x10

    .line 63
    .line 64
    if-ge v8, v9, :cond_1

    .line 65
    .line 66
    sget v9, Lcom/appsflyer/internal/AFb1cSDK;->$11:I

    .line 67
    .line 68
    add-int/lit8 v9, v9, 0x79

    .line 69
    .line 70
    rem-int/lit16 v9, v9, 0x80

    .line 71
    .line 72
    sput v9, Lcom/appsflyer/internal/AFb1cSDK;->$10:I

    .line 73
    .line 74
    aget-char v9, v5, v7

    .line 75
    .line 76
    aget-char v10, v5, v3

    .line 77
    .line 78
    add-int v11, v10, v6

    .line 79
    .line 80
    shl-int/lit8 v12, v10, 0x4

    .line 81
    .line 82
    sget-char v13, Lcom/appsflyer/internal/AFb1cSDK;->toString:C

    .line 83
    .line 84
    int-to-long v13, v13

    .line 85
    const-wide v15, -0x41032948b4d0744bL    # -2.7502760257546328E-5

    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    xor-long/2addr v13, v15

    .line 91
    long-to-int v13, v13

    .line 92
    int-to-char v13, v13

    .line 93
    add-int/2addr v12, v13

    .line 94
    xor-int/2addr v11, v12

    .line 95
    ushr-int/lit8 v12, v10, 0x5

    .line 96
    .line 97
    sget-char v13, Lcom/appsflyer/internal/AFb1cSDK;->copy:C

    .line 98
    .line 99
    int-to-long v13, v13

    .line 100
    xor-long/2addr v13, v15

    .line 101
    long-to-int v13, v13

    .line 102
    int-to-char v13, v13

    .line 103
    add-int/2addr v12, v13

    .line 104
    xor-int/2addr v11, v12

    .line 105
    sub-int/2addr v9, v11

    .line 106
    int-to-char v9, v9

    .line 107
    aput-char v9, v5, v7

    .line 108
    .line 109
    add-int v11, v9, v6

    .line 110
    .line 111
    shl-int/lit8 v12, v9, 0x4

    .line 112
    .line 113
    sget-char v13, Lcom/appsflyer/internal/AFb1cSDK;->component2:C

    .line 114
    .line 115
    int-to-long v13, v13

    .line 116
    xor-long/2addr v13, v15

    .line 117
    long-to-int v13, v13

    .line 118
    int-to-char v13, v13

    .line 119
    add-int/2addr v12, v13

    .line 120
    xor-int/2addr v11, v12

    .line 121
    ushr-int/lit8 v9, v9, 0x5

    .line 122
    .line 123
    sget-char v12, Lcom/appsflyer/internal/AFb1cSDK;->component3:C

    .line 124
    .line 125
    int-to-long v12, v12

    .line 126
    xor-long/2addr v12, v15

    .line 127
    long-to-int v12, v12

    .line 128
    int-to-char v12, v12

    .line 129
    add-int/2addr v9, v12

    .line 130
    xor-int/2addr v9, v11

    .line 131
    sub-int/2addr v10, v9

    .line 132
    int-to-char v9, v10

    .line 133
    aput-char v9, v5, v3

    .line 134
    .line 135
    const v9, 0x9e37

    .line 136
    .line 137
    .line 138
    sub-int/2addr v6, v9

    .line 139
    add-int/lit8 v8, v8, 0x1

    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_1
    iget v6, v1, Lcom/appsflyer/internal/AFj1aSDK;->getCurrencyIso4217Code:I

    .line 143
    .line 144
    aget-char v8, v5, v3

    .line 145
    .line 146
    aput-char v8, v2, v6

    .line 147
    .line 148
    add-int/lit8 v8, v6, 0x1

    .line 149
    .line 150
    aget-char v7, v5, v7

    .line 151
    .line 152
    aput-char v7, v2, v8

    .line 153
    .line 154
    add-int/2addr v6, v4

    .line 155
    iput v6, v1, Lcom/appsflyer/internal/AFj1aSDK;->getCurrencyIso4217Code:I

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_2
    new-instance v0, Ljava/lang/String;

    .line 159
    .line 160
    move/from16 v1, p1

    .line 161
    .line 162
    invoke-direct {v0, v2, v3, v1}, Ljava/lang/String;-><init>([CII)V

    .line 163
    .line 164
    .line 165
    sget v1, Lcom/appsflyer/internal/AFb1cSDK;->$11:I

    .line 166
    .line 167
    add-int/lit8 v1, v1, 0x27

    .line 168
    .line 169
    rem-int/lit16 v1, v1, 0x80

    .line 170
    .line 171
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->$10:I

    .line 172
    .line 173
    aput-object v0, p2, v3

    .line 174
    .line 175
    return-void
.end method

.method public static areAllFieldsValid()V
    .locals 1

    .line 1
    const v0, 0xac59

    .line 2
    .line 3
    .line 4
    sput-char v0, Lcom/appsflyer/internal/AFb1cSDK;->component2:C

    .line 5
    .line 6
    const v0, 0xcdf7

    .line 7
    .line 8
    .line 9
    sput-char v0, Lcom/appsflyer/internal/AFb1cSDK;->component3:C

    .line 10
    .line 11
    const/16 v0, 0x42cb

    .line 12
    .line 13
    sput-char v0, Lcom/appsflyer/internal/AFb1cSDK;->toString:C

    .line 14
    .line 15
    const/16 v0, 0x112e

    .line 16
    .line 17
    sput-char v0, Lcom/appsflyer/internal/AFb1cSDK;->copy:C

    .line 18
    .line 19
    return-void
.end method

.method private static component1()Ljava/lang/String;
    .locals 4
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v1

    .line 8
    long-to-int v1, v1

    .line 9
    const v2, -0x28cff324

    .line 10
    .line 11
    .line 12
    const v3, 0x28cff326

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/String;

    .line 20
    .line 21
    return-object v0
.end method

.method private declared-synchronized component3()V
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 3
    .line 4
    add-int/lit8 v0, v0, 0x53

    .line 5
    .line 6
    rem-int/lit16 v1, v0, 0x80

    .line 7
    .line 8
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 9
    .line 10
    rem-int/lit8 v0, v0, 0x2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/appsflyer/internal/AFb1cSDK;->areAllFieldsValid:Z

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :cond_0
    const/4 v0, 0x1

    .line 22
    :try_start_1
    iput-boolean v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->areAllFieldsValid:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 23
    .line 24
    :try_start_2
    const-string v0, "r_debugging_on"

    .line 25
    .line 26
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 27
    .line 28
    const-string v3, "yyyy-MM-dd HH:mm:ssZ"

    .line 29
    .line 30
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 31
    .line 32
    invoke-direct {v1, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 36
    .line 37
    .line 38
    move-result-wide v3

    .line 39
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v1, v3}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const/4 v3, 0x0

    .line 48
    new-array v3, v3, [Ljava/lang/String;

    .line 49
    .line 50
    invoke-direct {p0, v0, v1, v3}, Lcom/appsflyer/internal/AFb1cSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 51
    .line 52
    .line 53
    :try_start_3
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 54
    .line 55
    add-int/lit8 v0, v0, 0x13

    .line 56
    .line 57
    rem-int/lit16 v1, v0, 0x80

    .line 58
    .line 59
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 60
    .line 61
    rem-int/lit8 v0, v0, 0x2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 62
    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    monitor-exit p0

    .line 66
    return-void

    .line 67
    :cond_1
    :try_start_4
    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 68
    :catchall_0
    move-exception v0

    .line 69
    :try_start_5
    throw v0

    .line 70
    :catchall_1
    move-exception v0

    .line 71
    goto :goto_0

    .line 72
    :catchall_2
    move-exception v0

    .line 73
    move-object v4, v0

    .line 74
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 75
    .line 76
    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->w:Lcom/appsflyer/internal/AFg1cSDK;

    .line 77
    .line 78
    const-string v3, "Error while starting remote debugger"

    .line 79
    .line 80
    const/4 v6, 0x1

    .line 81
    const/4 v7, 0x1

    .line 82
    const/4 v5, 0x1

    .line 83
    invoke-virtual/range {v1 .. v7}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;ZZZ)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 84
    .line 85
    .line 86
    monitor-exit p0

    .line 87
    return-void

    .line 88
    :cond_2
    :try_start_6
    throw v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 89
    :goto_0
    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 90
    throw v0
.end method

.method private static component4()F
    .locals 2
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    new-instance v0, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sget v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x73

    .line 13
    .line 14
    rem-int/lit16 v1, v1, 0x80

    .line 15
    .line 16
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 17
    .line 18
    return v0
.end method

.method private declared-synchronized copy()Ljava/util/Map;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
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
    monitor-enter p0

    .line 2
    :try_start_0
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 3
    .line 4
    add-int/lit8 v0, v0, 0x75

    .line 5
    .line 6
    rem-int/lit16 v1, v0, 0x80

    .line 7
    .line 8
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 9
    .line 10
    rem-int/lit8 v0, v0, 0x2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    .line 12
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    :try_start_1
    const-string v0, "data"

    .line 17
    .line 18
    iget-object v2, p0, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1cSDK;->equals()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 27
    .line 28
    const/16 v1, 0xc

    .line 29
    .line 30
    :try_start_2
    div-int/lit8 v1, v1, 0x0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    :try_start_3
    throw v0

    .line 35
    :catchall_1
    move-exception v0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    const-string v0, "data"

    .line 38
    .line 39
    iget-object v2, p0, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1cSDK;->equals()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 48
    .line 49
    :goto_0
    sget v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 50
    .line 51
    add-int/lit8 v1, v1, 0x63

    .line 52
    .line 53
    rem-int/lit16 v1, v1, 0x80

    .line 54
    .line 55
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 56
    .line 57
    monitor-exit p0

    .line 58
    return-object v0

    .line 59
    :goto_1
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 60
    throw v0
.end method

.method private copydefault()Z
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x61

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/appsflyer/internal/AFb1cSDK;->component4:Z

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    add-int/lit8 v0, v0, 0x69

    .line 14
    .line 15
    rem-int/lit16 v0, v0, 0x80

    .line 16
    .line 17
    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/appsflyer/internal/AFb1cSDK;->AFAdRevenueData:Z

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-boolean p0, p0, Lcom/appsflyer/internal/AFb1cSDK;->areAllFieldsValid:Z

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    :cond_0
    add-int/lit8 v0, v0, 0x6d

    .line 28
    .line 29
    rem-int/lit16 v0, v0, 0x80

    .line 30
    .line 31
    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method private declared-synchronized equals()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork:Ljava/util/List;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue:I

    .line 11
    .line 12
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 13
    .line 14
    add-int/lit8 v0, v0, 0x59

    .line 15
    .line 16
    rem-int/lit16 v1, v0, 0x80

    .line 17
    .line 18
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 19
    .line 20
    rem-int/lit8 v0, v0, 0x2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    :try_start_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    :try_start_2
    throw v0

    .line 30
    :catchall_1
    move-exception v0

    .line 31
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 32
    throw v0
.end method

.method private static synthetic getCurrencyIso4217Code([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v0, p0, v0

    .line 3
    .line 4
    check-cast v0, Lcom/appsflyer/internal/AFb1cSDK;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget-object v1, p0, v1

    .line 8
    .line 9
    check-cast v1, Ljava/lang/String;

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    aget-object p0, p0, v2

    .line 13
    .line 14
    check-cast p0, Landroid/content/pm/PackageManager;

    .line 15
    .line 16
    sget v3, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 17
    .line 18
    add-int/lit8 v3, v3, 0x29

    .line 19
    .line 20
    rem-int/lit16 v4, v3, 0x80

    .line 21
    .line 22
    sput v4, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 23
    .line 24
    rem-int/2addr v3, v2

    .line 25
    const/4 v4, 0x0

    .line 26
    if-nez v3, :cond_2

    .line 27
    .line 28
    :try_start_0
    invoke-direct {v0, v1, p0}, Lcom/appsflyer/internal/AFb1cSDK;->n_(Ljava/lang/String;Landroid/content/pm/PackageManager;)Ljava/util/Map;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget-object v1, v0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    .line 33
    .line 34
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v1, v1, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v3, v0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    .line 41
    .line 42
    invoke-interface {v3}, Lcom/appsflyer/internal/AFd1fSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFe1sSDK;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v3, p0, v1}, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork(Ljava/util/Map;Ljava/lang/String;)Lcom/appsflyer/internal/AFe1wSDK;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    if-nez p0, :cond_1

    .line 51
    .line 52
    const-string p0, "could not send null proxy data"

    .line 53
    .line 54
    new-instance v0, Ljava/lang/NullPointerException;

    .line 55
    .line 56
    const-string v1, "request was null"

    .line 57
    .line 58
    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p0, v0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    .line 63
    .line 64
    sget p0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 65
    .line 66
    add-int/lit8 p0, p0, 0xb

    .line 67
    .line 68
    rem-int/lit16 v0, p0, 0x80

    .line 69
    .line 70
    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 71
    .line 72
    rem-int/2addr p0, v2

    .line 73
    if-eqz p0, :cond_0

    .line 74
    .line 75
    return-object v4

    .line 76
    :cond_0
    throw v4

    .line 77
    :catchall_0
    move-exception p0

    .line 78
    goto :goto_0

    .line 79
    :cond_1
    :try_start_1
    iget-object v0, v0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    .line 80
    .line 81
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->AFAdRevenueData()Ljava/util/concurrent/ExecutorService;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Lcom/appsflyer/internal/a;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Lcom/appsflyer/internal/a;-><init>(Lcom/appsflyer/internal/AFe1wSDK;)V

    .line 88
    .line 89
    .line 90
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 91
    .line 92
    .line 93
    return-object v4

    .line 94
    :cond_2
    invoke-direct {v0, v1, p0}, Lcom/appsflyer/internal/AFb1cSDK;->n_(Ljava/lang/String;Landroid/content/pm/PackageManager;)Ljava/util/Map;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    iget-object v1, v0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    .line 99
    .line 100
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iget-object v1, v1, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    .line 107
    .line 108
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFe1sSDK;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0, p0, v1}, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork(Ljava/util/Map;Ljava/lang/String;)Lcom/appsflyer/internal/AFe1wSDK;

    .line 113
    .line 114
    .line 115
    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    :goto_0
    const-string v0, "could not send proxy data"

    .line 117
    .line 118
    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 119
    .line 120
    .line 121
    return-object v4
.end method

.method private declared-synchronized getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    monitor-enter p0

    .line 150
    :try_start_0
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 v0, v0, 0x4d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    rem-int/lit8 v0, v0, 0x2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    if-eqz p1, :cond_1

    .line 151
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-lez v0, :cond_1

    :try_start_2
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 v0, v0, 0x6d

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    rem-int/lit8 v0, v0, 0x2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    iget-object v2, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    if-eqz v0, :cond_0

    :try_start_3
    const-string v0, "app_id"

    invoke-interface {v2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    const-string p2, "app_id"

    invoke-interface {v2, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    :try_start_4
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 p1, p1, 0x5

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_2

    .line 154
    iget-object p1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    const-string v0, "app_version"

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    if-eqz p3, :cond_3

    .line 155
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-lez p1, :cond_3

    .line 156
    :try_start_6
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p1, p1, 0x3

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 157
    :try_start_7
    iget-object p1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    const-string p2, "channel"

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    if-eqz p4, :cond_4

    .line 158
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_4

    .line 159
    iget-object p1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    const-string p2, "preInstall"

    invoke-interface {p1, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 160
    :cond_4
    monitor-exit p0

    return-void

    .line 161
    :cond_5
    :try_start_8
    throw v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 162
    :catchall_1
    monitor-exit p0

    return-void

    :goto_1
    :try_start_9
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    throw p1
.end method

.method private declared-synchronized getCurrencyIso4217Code(Lcom/appsflyer/internal/AFi1zSDK;Lcom/appsflyer/internal/AFi1zSDK;)Z
    .locals 3
    .param p1    # Lcom/appsflyer/internal/AFi1zSDK;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/appsflyer/internal/AFi1zSDK;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    monitor-enter p0

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 163
    :try_start_0
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 p1, p1, 0x7

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 164
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1cSDK;->valueOf()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 165
    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 166
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFi1zSDK;->AFAdRevenueData()Z

    move-result v1

    if-nez v1, :cond_1

    .line 167
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p1, p1, 0x5

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 168
    monitor-exit p0

    return v0

    .line 169
    :cond_1
    :try_start_2
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    move-result-object v1

    .line 170
    iget-object v1, v1, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    const-string v2, "appsFlyerCount"

    invoke-interface {v1, v2, v0}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    move-result v1

    .line 171
    iget v2, p1, Lcom/appsflyer/internal/AFi1zSDK;->AFAdRevenueData:I

    if-gt v1, v2, :cond_5

    .line 172
    sget v1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 v1, v1, 0x7

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 173
    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue(Lcom/appsflyer/internal/AFi1zSDK;Lcom/appsflyer/internal/AFi1zSDK;)Z

    move-result p2

    if-nez p2, :cond_2

    .line 174
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p1, p1, 0x7

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 175
    monitor-exit p0

    return v0

    .line 176
    :cond_2
    :try_start_3
    iget-object p2, p1, Lcom/appsflyer/internal/AFi1zSDK;->getMediationNetwork:Ljava/lang/String;

    .line 177
    invoke-direct {p0, p2}, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_3

    .line 178
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p1, p1, 0x5d

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return v0

    .line 179
    :cond_3
    :try_start_4
    iget-object p1, p1, Lcom/appsflyer/internal/AFi1zSDK;->areAllFieldsValid:Ljava/lang/String;

    .line 180
    invoke-static {p1}, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 181
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 p1, p1, 0x79

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return v0

    :cond_4
    monitor-exit p0

    const/4 p0, 0x1

    return p0

    .line 182
    :cond_5
    monitor-exit p0

    return v0

    .line 183
    :goto_0
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw p1
.end method

.method private static synthetic getMediationNetwork([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    const/4 v0, 0x0

    aget-object p0, p0, v0

    check-cast p0, Ljava/lang/String;

    .line 226
    invoke-static {p0}, Lcom/appsflyer/internal/AFc1tSDK;->getRevenue(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 227
    sget p0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p0, p0, 0x63

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    .line 228
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    .line 229
    :cond_1
    new-instance v1, Lcom/appsflyer/internal/AFe1zSDK;

    invoke-direct {v1}, Lcom/appsflyer/internal/AFe1zSDK;-><init>()V

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    long-to-int v1, v1

    const v2, -0x28cff324

    const v3, 0x28cff326

    invoke-static {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/appsflyer/internal/AFe1zSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 v0, v0, 0x9

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_2

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :cond_2
    const/4 p0, 0x0

    throw p0
.end method

.method private varargs declared-synchronized getMediationNetwork(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 3
    .line 4
    add-int/lit8 v0, v0, 0x4f

    .line 5
    .line 6
    rem-int/lit16 v1, v0, 0x80

    .line 7
    .line 8
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 9
    .line 10
    rem-int/lit8 v0, v0, 0x2

    .line 11
    .line 12
    if-nez v0, :cond_5

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1cSDK;->copydefault()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_4

    .line 19
    .line 20
    iget v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    const v1, 0x18000

    .line 23
    .line 24
    .line 25
    if-lt v0, v1, :cond_0

    .line 26
    .line 27
    goto/16 :goto_2

    .line 28
    .line 29
    :cond_0
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    const-string v2, ", "

    .line 34
    .line 35
    invoke-static {v2, p3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    new-instance v2, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v0, " "

    .line 50
    .line 51
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v0, " _/AppsFlyer_6.15.0 ["

    .line 66
    .line 67
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string p1, "] "

    .line 74
    .line 75
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string p1, " "

    .line 82
    .line 83
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    goto :goto_0

    .line 94
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v0, " "

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    .line 112
    .line 113
    .line 114
    move-result-wide v0

    .line 115
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v0, " "

    .line 119
    .line 120
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string p2, "/AppsFlyer_6.15.0 "

    .line 127
    .line 128
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    :goto_0
    iget p2, p0, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue:I

    .line 139
    .line 140
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 141
    .line 142
    .line 143
    move-result p3

    .line 144
    const/4 v0, 0x1

    .line 145
    shl-int/2addr p3, v0

    .line 146
    add-int/2addr p2, p3

    .line 147
    sget p3, Lcom/appsflyer/internal/AFb1cSDK;->getMediationNetwork:I

    .line 148
    .line 149
    const/4 v1, 0x0

    .line 150
    if-le p2, p3, :cond_2

    .line 151
    .line 152
    iget p2, p0, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue:I

    .line 153
    .line 154
    sub-int/2addr p3, p2

    .line 155
    div-int/lit8 p3, p3, 0x2

    .line 156
    .line 157
    invoke-virtual {p1, v1, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    move v1, v0

    .line 162
    :cond_2
    iget-object p2, p0, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork:Ljava/util/List;

    .line 163
    .line 164
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    iget p2, p0, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue:I

    .line 168
    .line 169
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    shl-int/2addr p1, v0

    .line 174
    add-int/2addr p2, p1

    .line 175
    iput p2, p0, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 176
    .line 177
    if-eqz v1, :cond_3

    .line 178
    .line 179
    :try_start_2
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 180
    .line 181
    add-int/lit8 p1, p1, 0x11

    .line 182
    .line 183
    rem-int/lit16 p1, p1, 0x80

    .line 184
    .line 185
    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 186
    .line 187
    :try_start_3
    iget-object p1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork:Ljava/util/List;

    .line 188
    .line 189
    const-string p2, "+~+~ The limit has been exceeded, and no more data is available. +~+~"

    .line 190
    .line 191
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    iget p1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue:I

    .line 195
    .line 196
    add-int/lit16 p1, p1, 0x8a

    .line 197
    .line 198
    iput p1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 199
    .line 200
    goto :goto_1

    .line 201
    :catchall_0
    move-exception p1

    .line 202
    goto :goto_3

    .line 203
    :cond_3
    :goto_1
    monitor-exit p0

    .line 204
    return-void

    .line 205
    :catchall_1
    monitor-exit p0

    .line 206
    return-void

    .line 207
    :cond_4
    :goto_2
    monitor-exit p0

    .line 208
    return-void

    .line 209
    :cond_5
    :try_start_4
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1cSDK;->copydefault()Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 210
    .line 211
    .line 212
    const/4 p1, 0x0

    .line 213
    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 214
    :catchall_2
    move-exception p1

    .line 215
    :try_start_6
    throw p1

    .line 216
    :goto_3
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 217
    throw p1
.end method

.method private static synthetic getMonetizationNetwork([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    const/4 v0, 0x0

    aget-object v1, p0, v0

    check-cast v1, Lcom/appsflyer/internal/AFb1cSDK;

    const/4 v2, 0x1

    aget-object p0, p0, v2

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    .line 106
    sget v2, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 v2, v2, 0x3f

    rem-int/lit16 v3, v2, 0x80

    sput v3, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    rem-int/lit8 v2, v2, 0x2

    const-string v3, "participantInProxy"

    if-nez v2, :cond_0

    .line 107
    iget-object v1, v1, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    move-result-object v1

    invoke-interface {v1, v3, p0}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;Z)V

    const/16 p0, 0xd

    .line 108
    div-int/2addr p0, v0

    goto :goto_0

    .line 109
    :cond_0
    iget-object v0, v1, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    move-result-object v0

    invoke-interface {v0, v3, p0}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;Z)V

    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static synthetic getMonetizationNetwork([Ljava/lang/Object;III)Ljava/lang/Object;
    .locals 4

    mul-int/lit16 v0, p1, -0x32d

    mul-int/lit16 v1, p2, 0x198

    add-int/2addr v0, v1

    not-int v1, p2

    or-int v2, v1, p1

    not-int v2, v2

    or-int v3, p1, p3

    not-int v3, v3

    or-int/2addr v2, v3

    mul-int/lit16 v2, v2, -0x32e

    add-int/2addr v0, v2

    not-int v2, p3

    or-int/2addr v1, v2

    not-int v1, v1

    not-int p1, p1

    or-int v2, p1, p2

    not-int v2, v2

    or-int/2addr v1, v2

    or-int/2addr v1, v3

    mul-int/lit16 v1, v1, 0x197

    add-int/2addr v0, v1

    or-int/2addr p1, p3

    not-int p1, p1

    or-int/2addr p1, v2

    or-int/2addr p2, p3

    not-int p2, p2

    or-int/2addr p1, p2

    mul-int/lit16 p1, p1, 0x197

    add-int/2addr v0, p1

    const/4 p1, 0x1

    if-eq v0, p1, :cond_2

    const/4 p1, 0x2

    if-eq v0, p1, :cond_1

    const/4 p1, 0x3

    if-eq v0, p1, :cond_0

    .line 83
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1cSDK;->getMediationNetwork([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_1
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_2
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static getMonetizationNetwork(Ljava/lang/String;)Z
    .locals 3

    .line 110
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-int v0, v0

    const v1, -0x551f2b8a

    const v2, 0x551f2b8d

    invoke-static {p0, v1, v2, v0}, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method private static getMonetizationNetwork(Ljava/lang/String;[Ljava/lang/StackTraceElement;)[Ljava/lang/String;
    .locals 4

    .line 98
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 v1, v0, 0x6d

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    if-nez p1, :cond_0

    .line 99
    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 100
    :cond_0
    array-length v1, p1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    .line 101
    aput-object p0, v1, v3

    add-int/2addr v0, v2

    .line 102
    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 103
    :goto_0
    array-length p0, p1

    if-ge v2, p0, :cond_1

    .line 104
    aget-object p0, p1, v2

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v1, v2

    add-int/lit8 v2, v2, 0x1

    .line 105
    sget p0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p0, p0, 0x13

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method private static getRevenue(Lcom/appsflyer/internal/AFh1aSDK;)Lcom/appsflyer/internal/AFi1zSDK;
    .locals 2
    .param p0    # Lcom/appsflyer/internal/AFh1aSDK;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    if-eqz p0, :cond_1

    .line 70
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x7d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    .line 71
    iget-object p0, p0, Lcom/appsflyer/internal/AFh1aSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFh1bSDK;

    const/16 v0, 0x5d

    .line 72
    div-int/lit8 v0, v0, 0x0

    if-eqz p0, :cond_1

    goto :goto_0

    .line 73
    :cond_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFh1aSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFh1bSDK;

    if-eqz p0, :cond_1

    .line 74
    :goto_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFh1bSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFi1zSDK;

    return-object p0

    .line 75
    :cond_1
    sget p0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 p0, p0, 0x19

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    const/4 p0, 0x0

    return-object p0
.end method

.method private static synthetic getRevenue([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 57
    sget p0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p0, p0, 0x13

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_0

    const-string p0, "6.15.0"

    return-object p0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method private getRevenue(Lcom/appsflyer/internal/AFi1zSDK;Lcom/appsflyer/internal/AFi1zSDK;)Z
    .locals 2
    .param p1    # Lcom/appsflyer/internal/AFi1zSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/appsflyer/internal/AFi1zSDK;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 58
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 59
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 p1, p1, 0x3f

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 60
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1cSDK;->AFInAppEventType()Z

    move-result p0

    return p0

    .line 61
    :cond_0
    iget p1, p1, Lcom/appsflyer/internal/AFi1zSDK;->getMonetizationNetwork:F

    .line 62
    invoke-static {p1}, Lcom/appsflyer/internal/AFb1cSDK;->AFAdRevenueData(F)Z

    move-result p1

    .line 63
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    filled-new-array {p0, p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v0, -0x2ae7ebae

    const v1, 0x2ae7ebaf

    invoke-static {p2, v0, v1, p0}, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 64
    sget p0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 p0, p0, 0x39

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    return p1
.end method

.method private getRevenue(Ljava/lang/String;)Z
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x49

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-static {p1}, Lcom/appsflyer/internal/AFc1tSDK;->getRevenue(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget p0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 20
    .line 21
    add-int/lit8 p0, p0, 0xd

    .line 22
    .line 23
    rem-int/lit16 p0, p0, 0x80

    .line 24
    .line 25
    sput p0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    .line 30
    .line 31
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {p0, v0}, Lcom/appsflyer/internal/AFb1vSDK;->getMonetizationNetwork(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0

    .line 52
    :cond_1
    invoke-static {p1}, Lcom/appsflyer/internal/AFc1tSDK;->getRevenue(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x0

    .line 56
    throw p0
.end method

.method private n_(Ljava/lang/String;Landroid/content/pm/PackageManager;)Ljava/util/Map;
    .locals 2
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/content/pm/PackageManager;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x63

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    .line 20
    .line 21
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->e()Lcom/appsflyer/internal/AFd1mSDK;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/appsflyer/internal/AFb1cSDK;->o_(Ljava/lang/String;Landroid/content/pm/PackageManager;Lcom/appsflyer/internal/AFg1rSDK;Lcom/appsflyer/internal/AFd1mSDK;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1cSDK;->copy()Ljava/util/Map;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 33
    .line 34
    add-int/lit8 p1, p1, 0x59

    .line 35
    .line 36
    rem-int/lit16 p1, p1, 0x80

    .line 37
    .line 38
    sput p1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_0
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    .line 46
    .line 47
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->e()Lcom/appsflyer/internal/AFd1mSDK;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/appsflyer/internal/AFb1cSDK;->o_(Ljava/lang/String;Landroid/content/pm/PackageManager;Lcom/appsflyer/internal/AFg1rSDK;Lcom/appsflyer/internal/AFd1mSDK;)V

    .line 52
    .line 53
    .line 54
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1cSDK;->copy()Ljava/util/Map;

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    throw p0
.end method

.method private declared-synchronized o_(Ljava/lang/String;Landroid/content/pm/PackageManager;Lcom/appsflyer/internal/AFg1rSDK;Lcom/appsflyer/internal/AFd1mSDK;)V
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const-string v1, "remote_debug_static_data"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iget-object v3, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v3}, Ljava/util/Map;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    :try_start_1
    iget-object p1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 21
    .line 22
    new-instance p2, Lorg/json/JSONObject;

    .line 23
    .line 24
    invoke-direct {p2, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p2}, Lcom/appsflyer/internal/AFa1pSDK;->AFAdRevenueData(Lorg/json/JSONObject;)Ljava/util/Map;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-interface {p1, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 32
    .line 33
    .line 34
    goto/16 :goto_2

    .line 35
    .line 36
    :cond_0
    :try_start_2
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFb1tSDK;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFb1tSDK;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v4}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-interface {v4}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    iget-object v4, v4, Lcom/appsflyer/internal/AFd1pSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFd1mSDK;

    .line 53
    .line 54
    iget-object v4, v4, Lcom/appsflyer/internal/AFd1mSDK;->component4:Lcom/appsflyer/internal/AFh1pSDK;

    .line 55
    .line 56
    const/4 v5, 0x0

    .line 57
    if-eqz v4, :cond_1

    .line 58
    .line 59
    new-instance v6, Lcom/appsflyer/internal/AFb1ySDK;

    .line 60
    .line 61
    iget-object v7, v4, Lcom/appsflyer/internal/AFh1pSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v4, v4, Lcom/appsflyer/internal/AFh1pSDK;->AFAdRevenueData:Ljava/lang/Boolean;

    .line 64
    .line 65
    invoke-direct {v6, v7, v4}, Lcom/appsflyer/internal/AFb1ySDK;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :catchall_0
    move-exception p1

    .line 70
    goto/16 :goto_3

    .line 71
    .line 72
    :cond_1
    move-object v6, v5

    .line 73
    :goto_0
    if-eqz v6, :cond_3

    .line 74
    .line 75
    sget v4, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 76
    .line 77
    add-int/lit8 v4, v4, 0x29

    .line 78
    .line 79
    rem-int/lit16 v7, v4, 0x80

    .line 80
    .line 81
    sput v7, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 82
    .line 83
    rem-int/lit8 v4, v4, 0x2

    .line 84
    .line 85
    if-eqz v4, :cond_2

    .line 86
    .line 87
    iget-object v5, v6, Lcom/appsflyer/internal/AFb1ySDK;->AFAdRevenueData:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_2
    iget-object p1, v6, Lcom/appsflyer/internal/AFb1ySDK;->AFAdRevenueData:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 91
    .line 92
    :try_start_3
    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 93
    :catchall_1
    move-exception p1

    .line 94
    :try_start_4
    throw p1

    .line 95
    :cond_3
    :goto_1
    iget-object p3, p3, Lcom/appsflyer/internal/AFg1rSDK;->areAllFieldsValid:Ljava/lang/String;

    .line 96
    .line 97
    iget-object p4, p4, Lcom/appsflyer/internal/AFd1mSDK;->getRevenue:Ljava/lang/String;

    .line 98
    .line 99
    invoke-direct {p0, v5, p3, p4}, Lcom/appsflyer/internal/AFb1cSDK;->AFAdRevenueData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    new-instance p3, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    const-string p4, "6.15.0."

    .line 105
    .line 106
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    sget-object p4, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p3

    .line 118
    invoke-virtual {v2}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 119
    .line 120
    .line 121
    move-result-object p4

    .line 122
    invoke-interface {p4}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 123
    .line 124
    .line 125
    move-result-object p4

    .line 126
    iget-object p4, p4, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 127
    .line 128
    const-string v2, "KSAppsFlyerId"

    .line 129
    .line 130
    invoke-virtual {v0, v2}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    const-string v4, "uid"

    .line 135
    .line 136
    invoke-virtual {v0, v4}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-direct {p0, p3, p4, v2, v4}, Lcom/appsflyer/internal/AFb1cSDK;->AFAdRevenueData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 141
    .line 142
    .line 143
    :try_start_5
    invoke-virtual {p2, p1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    iget p2, p2, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 148
    .line 149
    const-string p3, "channel"

    .line 150
    .line 151
    invoke-virtual {v0, p3}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p3

    .line 155
    const-string p4, "preInstallName"

    .line 156
    .line 157
    invoke-virtual {v0, p4}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p4

    .line 161
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 166
    .line 167
    .line 168
    :catchall_2
    :try_start_6
    new-instance p1, Lorg/json/JSONObject;

    .line 169
    .line 170
    iget-object p2, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 171
    .line 172
    invoke-direct {p1, p2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    :catchall_3
    :goto_2
    iget-object p1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 183
    .line 184
    const-string p2, "launch_counter"

    .line 185
    .line 186
    iget-object p3, p0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    .line 187
    .line 188
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 189
    .line 190
    .line 191
    move-result-object p3

    .line 192
    iget-object p3, p3, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    .line 193
    .line 194
    const-string p4, "appsFlyerCount"

    .line 195
    .line 196
    invoke-interface {p3, p4, v3}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    .line 197
    .line 198
    .line 199
    move-result p3

    .line 200
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p3

    .line 204
    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    sget p1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 208
    .line 209
    add-int/lit8 p1, p1, 0x3b

    .line 210
    .line 211
    rem-int/lit16 p2, p1, 0x80

    .line 212
    .line 213
    sput p2, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 214
    .line 215
    rem-int/lit8 p1, p1, 0x2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 216
    .line 217
    if-eqz p1, :cond_4

    .line 218
    .line 219
    const/16 p1, 0x32

    .line 220
    .line 221
    :try_start_7
    div-int/2addr p1, v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 222
    monitor-exit p0

    .line 223
    return-void

    .line 224
    :catchall_4
    move-exception p1

    .line 225
    :try_start_8
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 226
    :cond_4
    monitor-exit p0

    .line 227
    return-void

    .line 228
    :goto_3
    :try_start_9
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 229
    throw p1
.end method

.method private valueOf()V
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x45

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    .line 12
    .line 13
    const-string v1, "participantInProxy"

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/16 p0, 0x39

    .line 25
    .line 26
    div-int/lit8 p0, p0, 0x0

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public final declared-synchronized AFAdRevenueData()V
    .locals 2

    monitor-enter p0

    .line 169
    :try_start_0
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x6d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    rem-int/lit8 v0, v0, 0x2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    if-eqz v0, :cond_0

    :try_start_1
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 171
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x1

    .line 172
    iput v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue:I

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    .line 173
    :cond_0
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 174
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    .line 175
    iput v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue:I

    .line 176
    :goto_0
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x77

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    rem-int/lit8 v0, v0, 0x2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_1

    monitor-exit p0

    return-void

    :cond_1
    const/4 v0, 0x0

    :try_start_2
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception v0

    :try_start_3
    throw v0

    :goto_1
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method

.method public final component2()Z
    .locals 1

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/appsflyer/internal/AFb1cSDK;->areAllFieldsValid:Z

    .line 4
    .line 5
    add-int/lit8 v0, v0, 0x6d

    .line 6
    .line 7
    rem-int/lit16 v0, v0, 0x80

    .line 8
    .line 9
    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 10
    .line 11
    return p0
.end method

.method public final getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 147
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 v0, v0, 0x11

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    rem-int/lit8 v0, v0, 0x2

    const-string v1, "server_request"

    if-nez v0, :cond_0

    .line 148
    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, v1, p1, p2}, Lcom/appsflyer/internal/AFb1cSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, v1, p1, p2}, Lcom/appsflyer/internal/AFb1cSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 149
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p0, p0, 0x2d

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    return-void
.end method

.method public final getCurrencyIso4217Code()Z
    .locals 4

    .line 122
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x59

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    rem-int/lit8 v0, v0, 0x2

    .line 123
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    const/4 v2, 0x0

    if-nez v0, :cond_2

    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->component2()Lcom/appsflyer/internal/AFg1wSDK;

    move-result-object v0

    .line 124
    iget-object v0, v0, Lcom/appsflyer/internal/AFg1wSDK;->getRevenue:Lcom/appsflyer/internal/AFg1tSDK;

    .line 125
    iget-object v0, v0, Lcom/appsflyer/internal/AFg1tSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFh1aSDK;

    .line 126
    invoke-static {v0}, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue(Lcom/appsflyer/internal/AFh1aSDK;)Lcom/appsflyer/internal/AFi1zSDK;

    move-result-object v0

    .line 127
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->component2()Lcom/appsflyer/internal/AFg1wSDK;

    move-result-object v1

    .line 128
    iget-object v1, v1, Lcom/appsflyer/internal/AFg1wSDK;->getRevenue:Lcom/appsflyer/internal/AFg1tSDK;

    .line 129
    iget-object v1, v1, Lcom/appsflyer/internal/AFg1tSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFh1aSDK;

    .line 130
    invoke-static {v1}, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue(Lcom/appsflyer/internal/AFh1aSDK;)Lcom/appsflyer/internal/AFi1zSDK;

    move-result-object v1

    .line 131
    invoke-direct {p0, v0, v1}, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFi1zSDK;Lcom/appsflyer/internal/AFi1zSDK;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 132
    sget v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 v1, v1, 0x47

    rem-int/lit16 v3, v1, 0x80

    sput v3, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    rem-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_0

    .line 133
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1cSDK;->component3()V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1cSDK;->component3()V

    throw v2

    .line 134
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue()V

    .line 135
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork()V

    .line 136
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p0, p0, 0x6b

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    return v0

    .line 137
    :cond_2
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->component2()Lcom/appsflyer/internal/AFg1wSDK;

    move-result-object v0

    .line 138
    iget-object v0, v0, Lcom/appsflyer/internal/AFg1wSDK;->getRevenue:Lcom/appsflyer/internal/AFg1tSDK;

    .line 139
    iget-object v0, v0, Lcom/appsflyer/internal/AFg1tSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFh1aSDK;

    .line 140
    invoke-static {v0}, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue(Lcom/appsflyer/internal/AFh1aSDK;)Lcom/appsflyer/internal/AFi1zSDK;

    move-result-object v0

    .line 141
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1cSDK;->component1:Lcom/appsflyer/internal/AFd1fSDK;

    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->component2()Lcom/appsflyer/internal/AFg1wSDK;

    move-result-object v1

    .line 142
    iget-object v1, v1, Lcom/appsflyer/internal/AFg1wSDK;->getRevenue:Lcom/appsflyer/internal/AFg1tSDK;

    .line 143
    iget-object v1, v1, Lcom/appsflyer/internal/AFg1tSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFh1aSDK;

    .line 144
    invoke-static {v1}, Lcom/appsflyer/internal/AFb1cSDK;->getRevenue(Lcom/appsflyer/internal/AFh1aSDK;)Lcom/appsflyer/internal/AFi1zSDK;

    move-result-object v1

    .line 145
    invoke-direct {p0, v0, v1}, Lcom/appsflyer/internal/AFb1cSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFi1zSDK;Lcom/appsflyer/internal/AFi1zSDK;)Z

    .line 146
    throw v2
.end method

.method public final getMediationNetwork()V
    .locals 2

    .line 220
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 v0, v0, 0x1f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 221
    :goto_0
    iput-boolean v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->component4:Z

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :goto_1
    add-int/lit8 v1, v1, 0x2b

    .line 222
    rem-int/lit16 p0, v1, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    rem-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_1

    return-void

    :cond_1
    const/4 p0, 0x0

    throw p0
.end method

.method public final getMediationNetwork(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 218
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x3

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 219
    new-array v2, v0, [Ljava/lang/String;

    aput-object p2, v2, v0

    invoke-direct {p0, v1, p1, v2}, Lcom/appsflyer/internal/AFb1cSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    return-void

    :cond_0
    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, v1, p1, p2}, Lcom/appsflyer/internal/AFb1cSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method public final varargs getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1

    .line 223
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x35

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 224
    const-string v0, "public_api_call"

    invoke-direct {p0, v0, p1, p2}, Lcom/appsflyer/internal/AFb1cSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 225
    sget p0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p0, p0, 0x45

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    return-void
.end method

.method public final declared-synchronized getMonetizationNetwork()V
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 3
    .line 4
    add-int/lit8 v0, v0, 0xf

    .line 5
    .line 6
    rem-int/lit16 v0, v0, 0x80

    .line 7
    .line 8
    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->areAllFieldsValid:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->AFAdRevenueData:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    :try_start_1
    iput-boolean v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->areAllFieldsValid:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->AFAdRevenueData:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    .line 27
    :try_start_2
    const-string v1, "r_debugging_off"

    .line 28
    .line 29
    new-instance v2, Ljava/text/SimpleDateFormat;

    .line 30
    .line 31
    const-string v3, "yyyy-MM-dd HH:mm:ssZ"

    .line 32
    .line 33
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 34
    .line 35
    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 39
    .line 40
    .line 41
    move-result-wide v3

    .line 42
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v2, v3}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    new-array v0, v0, [Ljava/lang/String;

    .line 51
    .line 52
    invoke-direct {p0, v1, v2, v0}, Lcom/appsflyer/internal/AFb1cSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 53
    .line 54
    .line 55
    :try_start_3
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 56
    .line 57
    add-int/lit8 v0, v0, 0x1

    .line 58
    .line 59
    rem-int/lit16 v0, v0, 0x80

    .line 60
    .line 61
    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 62
    .line 63
    monitor-exit p0

    .line 64
    return-void

    .line 65
    :catchall_1
    move-exception v0

    .line 66
    move-object v4, v0

    .line 67
    :try_start_4
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 68
    .line 69
    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->w:Lcom/appsflyer/internal/AFg1cSDK;

    .line 70
    .line 71
    const-string v3, "Error while stopping remote debugger"

    .line 72
    .line 73
    const/4 v6, 0x1

    .line 74
    const/4 v7, 0x1

    .line 75
    const/4 v5, 0x1

    .line 76
    invoke-virtual/range {v1 .. v7}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;ZZZ)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 77
    .line 78
    .line 79
    monitor-exit p0

    .line 80
    return-void

    .line 81
    :goto_0
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 82
    throw v0
.end method

.method public final getMonetizationNetwork(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1

    .line 95
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 v0, v0, 0x2f

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    .line 96
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    filled-new-array {p2, p3}, [Ljava/lang/String;

    move-result-object p2

    const-string p3, "server_response"

    invoke-direct {p0, p3, p1, p2}, Lcom/appsflyer/internal/AFb1cSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 97
    sget p0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 p0, p0, 0x35

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    return-void
.end method

.method public final getMonetizationNetwork(Ljava/lang/Throwable;)V
    .locals 3

    .line 84
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x15

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 85
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 86
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    if-nez v0, :cond_0

    .line 87
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    :goto_0
    if-nez v0, :cond_1

    .line 88
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x5b

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    .line 89
    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p1

    .line 90
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x5f

    :goto_1
    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    goto :goto_2

    .line 91
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p1

    .line 92
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x45

    goto :goto_1

    .line 93
    :goto_2
    invoke-static {v2, p1}, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork(Ljava/lang/String;[Ljava/lang/StackTraceElement;)[Ljava/lang/String;

    move-result-object p1

    .line 94
    const-string v0, "exception"

    invoke-direct {p0, v0, v1, p1}, Lcom/appsflyer/internal/AFb1cSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method public final declared-synchronized getRevenue()V
    .locals 1

    monitor-enter p0

    .line 65
    :try_start_0
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I

    add-int/lit8 v0, v0, 0x1f

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    const/4 v0, 0x0

    .line 66
    iput-boolean v0, p0, Lcom/appsflyer/internal/AFb1cSDK;->AFAdRevenueData:Z

    .line 67
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1cSDK;->AFAdRevenueData()V

    .line 68
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1cSDK;->equals()V

    .line 69
    sget v0, Lcom/appsflyer/internal/AFb1cSDK;->equals:I

    add-int/lit8 v0, v0, 0x13

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1cSDK;->hashCode:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final m_(Ljava/lang/String;Landroid/content/pm/PackageManager;)V
    .locals 1

    .line 1
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

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
    const p2, -0x53131fe9

    .line 10
    .line 11
    .line 12
    const v0, 0x53131fe9

    .line 13
    .line 14
    .line 15
    invoke-static {p1, p2, v0, p0}, Lcom/appsflyer/internal/AFb1cSDK;->getMonetizationNetwork([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method
