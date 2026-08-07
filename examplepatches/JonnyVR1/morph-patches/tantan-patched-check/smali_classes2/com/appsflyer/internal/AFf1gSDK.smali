.class public Lcom/appsflyer/internal/AFf1gSDK;
.super Lcom/appsflyer/internal/AFf1oSDK;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/appsflyer/internal/AFf1oSDK<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final AFKeystoreWrapper:[Lcom/appsflyer/internal/AFf1zSDK;


# instance fields
.field private final AFInAppEventType:Lcom/appsflyer/internal/AFg1nSDK;

.field public final component3:Lcom/appsflyer/internal/AFa1mSDK;

.field protected final copy:Lcom/appsflyer/internal/AFg1fSDK;

.field private final copydefault:Lcom/appsflyer/internal/AFe1fSDK;

.field private final equals:Lcom/appsflyer/internal/AFd1pSDK;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private final hashCode:Lcom/appsflyer/internal/AFg1wSDK;

.field protected final toString:Lcom/appsflyer/internal/AFd1rSDK;

.field private final values:Lcom/appsflyer/internal/AFd1kSDK;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget-object v0, Lcom/appsflyer/internal/AFf1zSDK;->component3:Lcom/appsflyer/internal/AFf1zSDK;

    .line 2
    .line 3
    sget-object v1, Lcom/appsflyer/internal/AFf1zSDK;->component1:Lcom/appsflyer/internal/AFf1zSDK;

    .line 4
    .line 5
    sget-object v2, Lcom/appsflyer/internal/AFf1zSDK;->toString:Lcom/appsflyer/internal/AFf1zSDK;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/appsflyer/internal/AFf1zSDK;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/appsflyer/internal/AFf1gSDK;->AFKeystoreWrapper:[Lcom/appsflyer/internal/AFf1zSDK;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFd1fSDK;)V
    .locals 1
    .param p1    # Lcom/appsflyer/internal/AFa1mSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/appsflyer/internal/AFd1fSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 101
    invoke-direct {p0, p1, p2, v0}, Lcom/appsflyer/internal/AFf1gSDK;-><init>(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFd1fSDK;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFd1fSDK;Ljava/lang/String;)V
    .locals 3
    .param p1    # Lcom/appsflyer/internal/AFa1mSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/appsflyer/internal/AFd1fSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFf1zSDK;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/appsflyer/internal/AFf1zSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFf1zSDK;

    .line 6
    .line 7
    sget-object v2, Lcom/appsflyer/internal/AFf1zSDK;->getRevenue:Lcom/appsflyer/internal/AFf1zSDK;

    .line 8
    .line 9
    filled-new-array {v1, v2}, [Lcom/appsflyer/internal/AFf1zSDK;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {p0, v0, v1, p2, p3}, Lcom/appsflyer/internal/AFf1oSDK;-><init>(Lcom/appsflyer/internal/AFf1zSDK;[Lcom/appsflyer/internal/AFf1zSDK;Lcom/appsflyer/internal/AFd1fSDK;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1gSDK;->component3:Lcom/appsflyer/internal/AFa1mSDK;

    .line 17
    .line 18
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->values()Lcom/appsflyer/internal/AFe1fSDK;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1gSDK;->copydefault:Lcom/appsflyer/internal/AFe1fSDK;

    .line 23
    .line 24
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1gSDK;->toString:Lcom/appsflyer/internal/AFd1rSDK;

    .line 29
    .line 30
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->component2()Lcom/appsflyer/internal/AFg1wSDK;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1gSDK;->hashCode:Lcom/appsflyer/internal/AFg1wSDK;

    .line 35
    .line 36
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->valueOf()Lcom/appsflyer/internal/AFd1kSDK;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1gSDK;->values:Lcom/appsflyer/internal/AFd1kSDK;

    .line 41
    .line 42
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1gSDK;->equals:Lcom/appsflyer/internal/AFd1pSDK;

    .line 47
    .line 48
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->component3()Lcom/appsflyer/internal/AFg1fSDK;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1gSDK;->copy:Lcom/appsflyer/internal/AFg1fSDK;

    .line 53
    .line 54
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->force()Lcom/appsflyer/internal/AFg1nSDK;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1gSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFg1nSDK;

    .line 59
    .line 60
    sget-object p1, Lcom/appsflyer/internal/AFf1gSDK;->AFKeystoreWrapper:[Lcom/appsflyer/internal/AFf1zSDK;

    .line 61
    .line 62
    array-length p2, p1

    .line 63
    const/4 p3, 0x0

    .line 64
    :goto_0
    if-ge p3, p2, :cond_0

    .line 65
    .line 66
    aget-object v0, p1, p3

    .line 67
    .line 68
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1wSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFf1zSDK;

    .line 69
    .line 70
    if-eq v1, v0, :cond_1

    .line 71
    .line 72
    add-int/lit8 p3, p3, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    iget-object p1, p0, Lcom/appsflyer/internal/AFf1gSDK;->component3:Lcom/appsflyer/internal/AFa1mSDK;

    .line 76
    .line 77
    iget p1, p1, Lcom/appsflyer/internal/AFa1mSDK;->areAllFieldsValid:I

    .line 78
    .line 79
    iget-object p2, p0, Lcom/appsflyer/internal/AFf1wSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFf1zSDK;

    .line 80
    .line 81
    if-gtz p1, :cond_2

    .line 82
    .line 83
    sget-object p1, Lcom/appsflyer/internal/AFf1zSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFf1zSDK;

    .line 84
    .line 85
    if-eq p2, p1, :cond_1

    .line 86
    .line 87
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1wSDK;->getCurrencyIso4217Code:Ljava/util/Set;

    .line 88
    .line 89
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    :cond_1
    return-void

    .line 93
    :cond_2
    sget-object p1, Lcom/appsflyer/internal/AFf1zSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFf1zSDK;

    .line 94
    .line 95
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1wSDK;->getMonetizationNetwork:Ljava/util/Set;

    .line 96
    .line 97
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method private static component2(Lcom/appsflyer/internal/AFa1mSDK;)Ljava/util/Map;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/AFa1mSDK;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "meta"

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/util/Map;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    :cond_0
    return-object v0
.end method


# virtual methods
.method public final AFAdRevenueData(Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 19
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
    move-object/from16 v1, p0

    .line 2
    .line 3
    const v0, 0x3ef5b2aa

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    const-string v3, "Unexpected error"

    .line 11
    .line 12
    const-string v4, "JSON toString of eventParams map returns null"

    .line 13
    .line 14
    const-string v5, "*Non-printing character*"

    .line 15
    .line 16
    const-string v6, "\\p{C}"

    .line 17
    .line 18
    const-string v7, ""

    .line 19
    .line 20
    iget-object v0, v1, Lcom/appsflyer/internal/AFf1gSDK;->component3:Lcom/appsflyer/internal/AFa1mSDK;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Lcom/appsflyer/internal/AFf1gSDK;->getRevenue(Lcom/appsflyer/internal/AFa1mSDK;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, v1, Lcom/appsflyer/internal/AFf1gSDK;->component3:Lcom/appsflyer/internal/AFa1mSDK;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v8, "meta"

    .line 32
    .line 33
    invoke-interface {v0, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    :try_start_0
    iget-object v0, v1, Lcom/appsflyer/internal/AFf1gSDK;->hashCode:Lcom/appsflyer/internal/AFg1wSDK;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/appsflyer/internal/AFg1wSDK;->getRevenue:Lcom/appsflyer/internal/AFg1tSDK;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/appsflyer/internal/AFg1tSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFh1aSDK;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/appsflyer/internal/AFh1aSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFh1bSDK;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/appsflyer/internal/AFh1bSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFh1cSDK;

    .line 48
    .line 49
    iget-wide v9, v0, Lcom/appsflyer/internal/AFh1cSDK;->getMonetizationNetwork:D
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catch_0
    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    .line 53
    .line 54
    :goto_0
    invoke-static {v9, v10}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(D)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    iget-object v0, v1, Lcom/appsflyer/internal/AFf1gSDK;->component3:Lcom/appsflyer/internal/AFa1mSDK;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-interface {v0, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-object v0, v1, Lcom/appsflyer/internal/AFf1gSDK;->component3:Lcom/appsflyer/internal/AFa1mSDK;

    .line 70
    .line 71
    iget-object v8, v0, Lcom/appsflyer/internal/AFa1mSDK;->component3:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 74
    .line 75
    .line 76
    move-result-object v9

    .line 77
    const/4 v10, 0x0

    .line 78
    const/4 v11, 0x1

    .line 79
    :try_start_1
    new-instance v0, Lorg/json/JSONObject;

    .line 80
    .line 81
    invoke-direct {v0, v9}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v12
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 88
    if-eqz v12, :cond_1

    .line 89
    .line 90
    :try_start_2
    invoke-virtual {v12, v6, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    goto/16 :goto_8

    .line 95
    .line 96
    :catchall_0
    move-exception v0

    .line 97
    move-object v10, v12

    .line 98
    goto :goto_1

    .line 99
    :catch_1
    move-exception v0

    .line 100
    goto :goto_2

    .line 101
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    .line 102
    .line 103
    invoke-direct {v0, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    throw v0
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 107
    :catchall_1
    move-exception v0

    .line 108
    goto :goto_1

    .line 109
    :catch_2
    move-exception v0

    .line 110
    move-object v12, v10

    .line 111
    goto :goto_2

    .line 112
    :goto_1
    invoke-static {v3, v0, v11}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;Z)V

    .line 113
    .line 114
    .line 115
    move-object v0, v7

    .line 116
    move-object v12, v10

    .line 117
    goto/16 :goto_8

    .line 118
    .line 119
    :goto_2
    const-string v13, "JSONObject return null String object. Trying to create AFJsonObject."

    .line 120
    .line 121
    invoke-static {v13, v0, v11}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;Z)V

    .line 122
    .line 123
    .line 124
    :try_start_3
    filled-new-array {v9}, [Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    sget-object v9, Lcom/appsflyer/internal/AFa1tSDK;->AFLogger:Ljava/util/Map;

    .line 129
    .line 130
    invoke-interface {v9, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v13

    .line 134
    if-eqz v13, :cond_2

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_2
    const/4 v13, 0x0

    .line 138
    invoke-static {v13, v13, v13, v13}, Landroid/graphics/Color;->argb(IIII)I

    .line 139
    .line 140
    .line 141
    move-result v14

    .line 142
    rsub-int/lit8 v14, v14, 0x49

    .line 143
    .line 144
    invoke-static {}, Landroid/os/Process;->getElapsedCpuTime()J

    .line 145
    .line 146
    .line 147
    move-result-wide v15

    .line 148
    const-wide/16 v17, 0x0

    .line 149
    .line 150
    cmp-long v15, v15, v17

    .line 151
    .line 152
    add-int/lit8 v15, v15, 0x20

    .line 153
    .line 154
    invoke-static {v13}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 155
    .line 156
    .line 157
    move-result v13

    .line 158
    int-to-char v13, v13

    .line 159
    invoke-static {v14, v15, v13}, Lcom/appsflyer/internal/AFa1tSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v13

    .line 163
    check-cast v13, Ljava/lang/Class;

    .line 164
    .line 165
    const-string v14, "AFAdRevenueData"

    .line 166
    .line 167
    const-class v15, Ljava/util/Map;

    .line 168
    .line 169
    filled-new-array {v15}, [Ljava/lang/Class;

    .line 170
    .line 171
    .line 172
    move-result-object v15

    .line 173
    invoke-virtual {v13, v14, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 174
    .line 175
    .line 176
    move-result-object v13

    .line 177
    invoke-interface {v9, v2, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    :goto_3
    check-cast v13, Ljava/lang/reflect/Method;

    .line 181
    .line 182
    invoke-virtual {v13, v10, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    move-object v2, v0

    .line 187
    check-cast v2, Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 188
    .line 189
    if-eqz v2, :cond_3

    .line 190
    .line 191
    :try_start_4
    invoke-virtual {v2, v6, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    move-object v12, v2

    .line 196
    goto :goto_8

    .line 197
    :catchall_2
    move-exception v0

    .line 198
    move-object v12, v2

    .line 199
    goto :goto_4

    .line 200
    :catch_3
    move-exception v0

    .line 201
    move-object v12, v2

    .line 202
    goto :goto_6

    .line 203
    :catch_4
    move-exception v0

    .line 204
    move-object v12, v2

    .line 205
    goto :goto_7

    .line 206
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    .line 207
    .line 208
    invoke-direct {v0, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    throw v0
    :try_end_4
    .catch Ljava/lang/NullPointerException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 212
    :catchall_3
    move-exception v0

    .line 213
    :try_start_5
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    if-eqz v2, :cond_4

    .line 218
    .line 219
    throw v2

    .line 220
    :catchall_4
    move-exception v0

    .line 221
    goto :goto_4

    .line 222
    :catch_5
    move-exception v0

    .line 223
    goto :goto_6

    .line 224
    :catch_6
    move-exception v0

    .line 225
    goto :goto_7

    .line 226
    :cond_4
    throw v0
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_5 .. :try_end_5} :catch_6
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 227
    :goto_4
    invoke-static {v3, v0, v11}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;Z)V

    .line 228
    .line 229
    .line 230
    :goto_5
    move-object v0, v7

    .line 231
    goto :goto_8

    .line 232
    :goto_6
    const-string v2, "AFFinalizer: reflection init failed"

    .line 233
    .line 234
    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 235
    .line 236
    .line 237
    goto :goto_5

    .line 238
    :goto_7
    const-string v2, "AFJsonObject return null String object."

    .line 239
    .line 240
    invoke-static {v2, v0, v11}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;Z)V

    .line 241
    .line 242
    .line 243
    goto :goto_5

    .line 244
    :goto_8
    if-nez v12, :cond_5

    .line 245
    .line 246
    goto :goto_9

    .line 247
    :cond_5
    move-object v7, v12

    .line 248
    :goto_9
    invoke-virtual {v0, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    move-result v2

    .line 252
    if-nez v2, :cond_6

    .line 253
    .line 254
    const-string v2, "Payload contains non-printing characters"

    .line 255
    .line 256
    invoke-static {v2}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    goto :goto_a

    .line 260
    :cond_6
    move-object v0, v7

    .line 261
    :goto_a
    new-instance v2, Ljava/lang/StringBuilder;

    .line 262
    .line 263
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    const-string v3, ": preparing data: "

    .line 270
    .line 271
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    invoke-static {v2}, Lcom/appsflyer/internal/AFb1kSDK;->getMediationNetwork(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    iget-object v2, v1, Lcom/appsflyer/internal/AFf1oSDK;->component2:Lcom/appsflyer/internal/AFb1bSDK;

    .line 285
    .line 286
    invoke-interface {v2, v8, v0}, Lcom/appsflyer/internal/AFb1bSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    iget-object v0, v1, Lcom/appsflyer/internal/AFf1oSDK;->component4:Lcom/appsflyer/internal/AFe1sSDK;

    .line 290
    .line 291
    iget-object v2, v1, Lcom/appsflyer/internal/AFf1gSDK;->component3:Lcom/appsflyer/internal/AFa1mSDK;

    .line 292
    .line 293
    iget-object v1, v1, Lcom/appsflyer/internal/AFf1gSDK;->values:Lcom/appsflyer/internal/AFd1kSDK;

    .line 294
    .line 295
    move-object/from16 v3, p1

    .line 296
    .line 297
    invoke-virtual {v0, v2, v3, v1}, Lcom/appsflyer/internal/AFe1sSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFa1mSDK;Ljava/lang/String;Lcom/appsflyer/internal/AFd1kSDK;)Lcom/appsflyer/internal/AFe1rSDK;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    return-object v0
.end method

.method public AFAdRevenueData(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 0

    .line 302
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1gSDK;->copy:Lcom/appsflyer/internal/AFg1fSDK;

    invoke-interface {p0, p1}, Lcom/appsflyer/internal/AFg1fSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFa1mSDK;)V

    return-void
.end method

.method public final component1()Lcom/appsflyer/attribution/AppsFlyerRequestListener;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1gSDK;->component3:Lcom/appsflyer/internal/AFa1mSDK;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 4
    .line 5
    return-object p0
.end method

.method public equals()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public getCurrencyIso4217Code(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1gSDK;->copy:Lcom/appsflyer/internal/AFg1fSDK;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/appsflyer/internal/AFg1fSDK;->getRevenue(Lcom/appsflyer/internal/AFa1mSDK;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getMediationNetwork(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1gSDK;->copy:Lcom/appsflyer/internal/AFg1fSDK;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Lcom/appsflyer/internal/AFg1fSDK;->getCurrencyIso4217Code(Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public getMonetizationNetwork(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1gSDK;->copy:Lcom/appsflyer/internal/AFg1fSDK;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/appsflyer/internal/AFg1fSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFa1mSDK;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getRevenue(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 8
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFf1gSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFa1mSDK;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFf1gSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFa1mSDK;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFf1gSDK;->getMonetizationNetwork(Lcom/appsflyer/internal/AFa1mSDK;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFf1gSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFa1mSDK;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v2

    .line 17
    :try_start_1
    const-string v3, "Error while collecting payload params"

    .line 18
    .line 19
    invoke-static {v3, v2, v0, v1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;ZZ)V

    .line 20
    .line 21
    .line 22
    :goto_0
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->component2()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    iget-object v2, p0, Lcom/appsflyer/internal/AFf1oSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    new-instance v4, Lcom/appsflyer/internal/AFd1oSDK;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/appsflyer/internal/AFg1rSDK;->getRevenue:Lcom/appsflyer/internal/AFd1kSDK;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 39
    .line 40
    invoke-direct {v4, v3, v2}, Lcom/appsflyer/internal/AFd1oSDK;-><init>(Ljava/util/Map;Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v4}, Lcom/appsflyer/internal/AFa1mSDK;->getMediationNetwork(Ljava/util/Map;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Lcom/appsflyer/internal/AFf1oSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v2, v3}, Lcom/appsflyer/internal/AFg1rSDK;->getMonetizationNetwork(Ljava/util/Map;)Ljava/util/Map;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {p1, v2}, Lcom/appsflyer/internal/AFa1mSDK;->getMediationNetwork(Ljava/util/Map;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Lcom/appsflyer/internal/AFf1gSDK;->equals:Lcom/appsflyer/internal/AFd1pSDK;

    .line 60
    .line 61
    const-string v3, "com.appsflyer.security.enable"

    .line 62
    .line 63
    invoke-virtual {v2, v3}, Lcom/appsflyer/internal/AFd1pSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 67
    if-eqz v2, :cond_0

    .line 68
    .line 69
    :try_start_2
    new-instance v2, Lcom/appsflyer/internal/AFb1sSDK;

    .line 70
    .line 71
    invoke-direct {v2, p1}, Lcom/appsflyer/internal/AFb1sSDK;-><init>(Lcom/appsflyer/internal/AFa1mSDK;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2}, Lcom/appsflyer/internal/AFb1sSDK;->afInfoLog()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :catchall_1
    move-exception p0

    .line 79
    goto/16 :goto_6

    .line 80
    .line 81
    :catch_0
    move-exception v2

    .line 82
    :try_start_3
    const-string v3, "native: reflection init failed"

    .line 83
    .line 84
    invoke-static {v3, v2}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 85
    .line 86
    .line 87
    :cond_0
    :goto_1
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->areAllFieldsValid()Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_1

    .line 92
    .line 93
    iget-object v2, p0, Lcom/appsflyer/internal/AFf1oSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 94
    .line 95
    invoke-virtual {v2}, Lcom/appsflyer/internal/AFg1rSDK;->AFAdRevenueData()Ljava/util/Map;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {p1, v2}, Lcom/appsflyer/internal/AFa1mSDK;->getMediationNetwork(Ljava/util/Map;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 100
    .line 101
    .line 102
    :cond_1
    iget-object v2, p0, Lcom/appsflyer/internal/AFf1wSDK;->getCurrencyIso4217Code:Ljava/util/Set;

    .line 103
    .line 104
    sget-object v3, Lcom/appsflyer/internal/AFf1zSDK;->hashCode:Lcom/appsflyer/internal/AFf1zSDK;

    .line 105
    .line 106
    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-nez v3, :cond_3

    .line 111
    .line 112
    sget-object v3, Lcom/appsflyer/internal/AFf1zSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFf1zSDK;

    .line 113
    .line 114
    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-eqz v2, :cond_2

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_2
    move v2, v1

    .line 122
    goto :goto_3

    .line 123
    :cond_3
    :goto_2
    move v2, v0

    .line 124
    :goto_3
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFf1wSDK;->component3()Z

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    if-eqz v3, :cond_4

    .line 129
    .line 130
    if-eqz v2, :cond_4

    .line 131
    .line 132
    iget-object v2, p0, Lcom/appsflyer/internal/AFf1gSDK;->toString:Lcom/appsflyer/internal/AFd1rSDK;

    .line 133
    .line 134
    const-string v3, "appsFlyerCount"

    .line 135
    .line 136
    invoke-interface {v2, v3, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    invoke-virtual {p1, v2}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(I)Lcom/appsflyer/internal/AFa1mSDK;

    .line 141
    .line 142
    .line 143
    :cond_4
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->component3()Z

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    if-eqz v2, :cond_9

    .line 148
    .line 149
    invoke-static {p1}, Lcom/appsflyer/internal/AFf1gSDK;->component2(Lcom/appsflyer/internal/AFa1mSDK;)Ljava/util/Map;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    const-string v3, "host"

    .line 154
    .line 155
    iget-object v4, p0, Lcom/appsflyer/internal/AFf1gSDK;->copydefault:Lcom/appsflyer/internal/AFe1fSDK;

    .line 156
    .line 157
    new-instance v5, Lcom/appsflyer/internal/AFe1cSDK;

    .line 158
    .line 159
    invoke-virtual {v4}, Lcom/appsflyer/internal/AFe1fSDK;->getMediationNetwork()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v6

    .line 163
    invoke-virtual {v4}, Lcom/appsflyer/internal/AFe1fSDK;->getMonetizationNetwork()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    invoke-static {}, Lcom/appsflyer/internal/AFe1fSDK;->AFAdRevenueData()Z

    .line 168
    .line 169
    .line 170
    move-result v7

    .line 171
    if-eqz v7, :cond_5

    .line 172
    .line 173
    sget-object v7, Lcom/appsflyer/internal/AFe1bSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFe1bSDK;

    .line 174
    .line 175
    goto :goto_4

    .line 176
    :cond_5
    sget-object v7, Lcom/appsflyer/internal/AFe1bSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFe1bSDK;

    .line 177
    .line 178
    :goto_4
    invoke-direct {v5, v6, v4, v7}, Lcom/appsflyer/internal/AFe1cSDK;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/appsflyer/internal/AFe1bSDK;)V

    .line 179
    .line 180
    .line 181
    new-instance v4, Lorg/json/JSONObject;

    .line 182
    .line 183
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 184
    .line 185
    .line 186
    const-string v6, "name"

    .line 187
    .line 188
    iget-object v7, v5, Lcom/appsflyer/internal/AFe1cSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 191
    .line 192
    .line 193
    iget-object v6, v5, Lcom/appsflyer/internal/AFe1cSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFe1bSDK;

    .line 194
    .line 195
    sget-object v7, Lcom/appsflyer/internal/AFe1bSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFe1bSDK;

    .line 196
    .line 197
    if-eq v6, v7, :cond_6

    .line 198
    .line 199
    const-string v7, "method"

    .line 200
    .line 201
    iget-object v6, v6, Lcom/appsflyer/internal/AFe1bSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 202
    .line 203
    invoke-virtual {v4, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 204
    .line 205
    .line 206
    :cond_6
    iget-object v6, v5, Lcom/appsflyer/internal/AFe1cSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 207
    .line 208
    if-eqz v6, :cond_8

    .line 209
    .line 210
    invoke-static {v6}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 211
    .line 212
    .line 213
    move-result v6

    .line 214
    if-eqz v6, :cond_7

    .line 215
    .line 216
    goto :goto_5

    .line 217
    :cond_7
    const-string v6, "prefix"

    .line 218
    .line 219
    iget-object v5, v5, Lcom/appsflyer/internal/AFe1cSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v4, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 222
    .line 223
    .line 224
    :cond_8
    :goto_5
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    :cond_9
    iget-object v2, p0, Lcom/appsflyer/internal/AFf1gSDK;->equals:Lcom/appsflyer/internal/AFd1pSDK;

    .line 228
    .line 229
    const-string v3, "AF_PREINSTALL_DISABLED"

    .line 230
    .line 231
    invoke-virtual {v2, v3}, Lcom/appsflyer/internal/AFd1pSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Z

    .line 232
    .line 233
    .line 234
    move-result v2

    .line 235
    if-eqz v2, :cond_a

    .line 236
    .line 237
    invoke-static {p1}, Lcom/appsflyer/internal/AFf1gSDK;->component2(Lcom/appsflyer/internal/AFa1mSDK;)Ljava/util/Map;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    const-string v3, "preinstall_disabled"

    .line 242
    .line 243
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 244
    .line 245
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    :cond_a
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1gSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFg1nSDK;

    .line 249
    .line 250
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFf1zSDK;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    invoke-interface {p0, v2, p1}, Lcom/appsflyer/internal/AFg1nSDK;->getMediationNetwork(Ljava/util/Map;Lcom/appsflyer/internal/AFf1zSDK;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    :goto_6
    const-string p1, "Error while preparing to send event"

    .line 263
    .line 264
    invoke-static {p1, p0, v0, v1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;ZZ)V

    .line 265
    .line 266
    .line 267
    return-void
.end method
