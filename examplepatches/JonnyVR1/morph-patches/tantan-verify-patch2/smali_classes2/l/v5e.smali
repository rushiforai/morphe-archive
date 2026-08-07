.class public Ll/v5e;
.super Ll/p95;
.source "SourceFile"


# instance fields
.field private final b:Ljava/lang/Object;

.field private final c:Ll/ch2;

.field private final d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field private final e:Ll/w36;

.field private final f:Lcom/clevertap/android/sdk/Logger;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/ch2;Ll/w36;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/p95;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/v5e;->b:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p1, p0, Ll/v5e;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/v5e;->f:Lcom/clevertap/android/sdk/Logger;

    .line 18
    .line 19
    iput-object p2, p0, Ll/v5e;->c:Ll/ch2;

    .line 20
    .line 21
    iput-object p3, p0, Ll/v5e;->e:Ll/w36;

    .line 22
    .line 23
    return-void
.end method

.method private b(Lorg/json/JSONArray;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    iget-object v0, p0, Ll/v5e;->b:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-object v1, p0, Ll/v5e;->e:Ll/w36;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/w36;->c()Ll/ou3;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/v5e;->e:Ll/w36;

    .line 22
    .line 23
    new-instance v2, Ll/ou3;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/ou3;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ll/w36;->o(Ll/ou3;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    iget-object v0, p0, Ll/v5e;->e:Ll/w36;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/w36;->c()Ll/ou3;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0, p1}, Ll/ou3;->b(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Ll/v5e;->c:Ll/ch2;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/ch2;->t(Ljava/util/ArrayList;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    throw p0

    .line 53
    :cond_2
    :goto_2
    iget-object p1, p0, Ll/v5e;->f:Lcom/clevertap/android/sdk/Logger;

    .line 54
    .line 55
    iget-object p0, p0, Ll/v5e;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v0, "DisplayUnit : Can\'t parse Display Units, jsonArray is either empty or null"

    .line 62
    .line 63
    invoke-virtual {p1, p0, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method


# virtual methods
.method public a(Lorg/json/JSONObject;Ljava/lang/String;Landroid/content/Context;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/v5e;->f:Lcom/clevertap/android/sdk/Logger;

    .line 2
    .line 3
    iget-object p3, p0, Ll/v5e;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    const-string v0, "Processing Display Unit items..."

    .line 10
    .line 11
    invoke-virtual {p2, p3, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Ll/v5e;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

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
    iget-object p1, p0, Ll/v5e;->f:Lcom/clevertap/android/sdk/Logger;

    .line 23
    .line 24
    iget-object p0, p0, Ll/v5e;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p2, "CleverTap instance is configured to analytics only, not processing Display Unit response"

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
    iget-object p1, p0, Ll/v5e;->f:Lcom/clevertap/android/sdk/Logger;

    .line 39
    .line 40
    iget-object p0, p0, Ll/v5e;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p2, "DisplayUnit : Can\'t parse Display Unit Response, JSON response object is null"

    .line 47
    .line 48
    invoke-virtual {p1, p0, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    const-string p2, "adUnit_notifs"

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    iget-object v0, p0, Ll/v5e;->f:Lcom/clevertap/android/sdk/Logger;

    .line 59
    .line 60
    if-nez p3, :cond_2

    .line 61
    .line 62
    iget-object p0, p0, Ll/v5e;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string p1, "DisplayUnit : JSON object doesn\'t contain the Display Units key"

    .line 69
    .line 70
    invoke-virtual {v0, p0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    :try_start_0
    iget-object p3, p0, Ll/v5e;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 75
    .line 76
    invoke-virtual {p3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    const-string v1, "DisplayUnit : Processing Display Unit response"

    .line 81
    .line 82
    invoke-virtual {v0, p3, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-direct {p0, p1}, Ll/v5e;->b(Lorg/json/JSONArray;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :catchall_0
    move-exception p1

    .line 94
    iget-object p2, p0, Ll/v5e;->f:Lcom/clevertap/android/sdk/Logger;

    .line 95
    .line 96
    iget-object p0, p0, Ll/v5e;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    const-string p3, "DisplayUnit : Failed to parse response"

    .line 103
    .line 104
    invoke-virtual {p2, p0, p3, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method
