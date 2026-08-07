.class public Ll/zl90;
.super Ll/p95;
.source "SourceFile"


# instance fields
.field private final b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field private final c:Ll/bu9;

.field private final d:Lcom/clevertap/android/sdk/Logger;

.field private final e:Ll/w36;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/bu9;Ll/w36;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/p95;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zl90;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/zl90;->d:Lcom/clevertap/android/sdk/Logger;

    .line 11
    .line 12
    iput-object p2, p0, Ll/zl90;->c:Ll/bu9;

    .line 13
    .line 14
    iput-object p3, p0, Ll/zl90;->e:Ll/w36;

    .line 15
    .line 16
    return-void
.end method

.method private b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zl90;->c:Ll/bu9;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bu9;->H()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/zl90;->e:Ll/w36;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/w36;->f()Lcom/clevertap/android/sdk/product_config/CTProductConfigController;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/zl90;->e:Ll/w36;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/w36;->f()Lcom/clevertap/android/sdk/product_config/CTProductConfigController;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/product_config/CTProductConfigController;->o()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Ll/zl90;->c:Ll/bu9;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, v0}, Ll/bu9;->g0(Z)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method private c(Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    const-string v0, "kv"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/zl90;->e:Ll/w36;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/w36;->f()Lcom/clevertap/android/sdk/product_config/CTProductConfigController;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/zl90;->e:Ll/w36;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/w36;->f()Lcom/clevertap/android/sdk/product_config/CTProductConfigController;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/product_config/CTProductConfigController;->p(Lorg/json/JSONObject;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-direct {p0}, Ll/zl90;->b()V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public a(Lorg/json/JSONObject;Ljava/lang/String;Landroid/content/Context;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/zl90;->d:Lcom/clevertap/android/sdk/Logger;

    .line 2
    .line 3
    iget-object p3, p0, Ll/zl90;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    const-string v0, "Processing Product Config response..."

    .line 10
    .line 11
    invoke-virtual {p2, p3, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Ll/zl90;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->isAnalyticsOnly()Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Ll/zl90;->d:Lcom/clevertap/android/sdk/Logger;

    .line 23
    .line 24
    iget-object p0, p0, Ll/zl90;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p2, "CleverTap instance is configured to analytics only, not processing Product Config response"

    .line 31
    .line 32
    invoke-virtual {p1, p0, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    if-nez p1, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Ll/zl90;->d:Lcom/clevertap/android/sdk/Logger;

    .line 39
    .line 40
    iget-object p2, p0, Ll/zl90;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 41
    .line 42
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    const-string p3, "Product Config : Can\'t parse Product Config Response, JSON response object is null"

    .line 47
    .line 48
    invoke-virtual {p1, p2, p3}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0}, Ll/zl90;->b()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    const-string p2, "pc_notifs"

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    iget-object v0, p0, Ll/zl90;->d:Lcom/clevertap/android/sdk/Logger;

    .line 62
    .line 63
    if-nez p3, :cond_2

    .line 64
    .line 65
    iget-object p1, p0, Ll/zl90;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-string p2, "Product Config : JSON object doesn\'t contain the Product Config key"

    .line 72
    .line 73
    invoke-virtual {v0, p1, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-direct {p0}, Ll/zl90;->b()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_2
    :try_start_0
    iget-object p3, p0, Ll/zl90;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 81
    .line 82
    invoke-virtual {p3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    const-string v1, "Product Config : Processing Product Config response"

    .line 87
    .line 88
    invoke-virtual {v0, p3, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-direct {p0, p1}, Ll/zl90;->c(Lorg/json/JSONObject;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :catchall_0
    move-exception p1

    .line 100
    invoke-direct {p0}, Ll/zl90;->b()V

    .line 101
    .line 102
    .line 103
    iget-object p2, p0, Ll/zl90;->d:Lcom/clevertap/android/sdk/Logger;

    .line 104
    .line 105
    iget-object p0, p0, Ll/zl90;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const-string p3, "Product Config : Failed to parse Product Config response"

    .line 112
    .line 113
    invoke-virtual {p2, p0, p3, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method
