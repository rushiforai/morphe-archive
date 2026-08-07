.class public Ll/yhi;
.super Ll/p95;
.source "SourceFile"


# instance fields
.field private final b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field private final c:Ll/w36;

.field private final d:Ll/ch2;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/w36;Ll/ch2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/p95;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yhi;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yhi;->c:Ll/w36;

    .line 7
    .line 8
    iput-object p3, p0, Ll/yhi;->d:Ll/ch2;

    .line 9
    .line 10
    return-void
.end method

.method private b(Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    const-string v0, "abVariantInfo"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const-string p1, "JSON object doesn\'t contain the abVariantInfo key"

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/yhi;->e(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    :try_start_0
    const-string v1, "Processing Variants response"

    .line 16
    .line 17
    invoke-direct {p0, v1}, Ll/yhi;->e(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    const-string p1, "Not handling AB variants cache as response is null"

    .line 27
    .line 28
    invoke-direct {p0, p1}, Ll/yhi;->e(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iget-object v0, p0, Ll/yhi;->c:Ll/w36;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/w36;->g()Ll/ex3;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ll/ex3;->g(Lorg/json/JSONArray;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    const-string p1, "Can\'t parse Variant Response, CTVariables is null"

    .line 47
    .line 48
    invoke-direct {p0, p1}, Ll/yhi;->e(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :goto_0
    const-string v0, "Failed to parse variants response"

    .line 53
    .line 54
    invoke-direct {p0, v0, p1}, Ll/yhi;->f(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private c(Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    const-string v0, "vars"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const-string p1, "JSON object doesn\'t contain the vars key"

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/yhi;->e(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    :try_start_0
    const-string v1, "Processing Request Variables response"

    .line 16
    .line 17
    invoke-direct {p0, v1}, Ll/yhi;->e(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object v0, p0, Ll/yhi;->c:Ll/w36;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/w36;->g()Ll/ex3;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Ll/yhi;->d:Ll/ch2;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/ch2;->j()Ll/xhi;

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/yhi;->c:Ll/w36;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/w36;->g()Ll/ex3;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {v0, p1, v1}, Ll/ex3;->h(Lorg/json/JSONObject;Ll/xhi;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/yhi;->d:Ll/ch2;

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Ll/ch2;->x(Ll/xhi;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :catchall_0
    move-exception p1

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const-string p1, "Can\'t parse Variable Response, CTVariables is null"

    .line 56
    .line 57
    invoke-direct {p0, p1}, Ll/yhi;->e(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :goto_0
    const-string v0, "Failed to parse response"

    .line 62
    .line 63
    invoke-direct {p0, v0, p1}, Ll/yhi;->f(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private d(Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p0, "variables"

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private e(Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p0, "variables"

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private f(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "variables"

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/clevertap/android/sdk/Logger;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lorg/json/JSONObject;Ljava/lang/String;Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "Processing Variable response..."

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/yhi;->e(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "processResponse() called with: response = ["

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, "], stringBody = ["

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p2, "], context = ["

    .line 25
    .line 26
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p2, "]"

    .line 33
    .line 34
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-direct {p0, p2}, Ll/yhi;->d(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Ll/yhi;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 45
    .line 46
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->isAnalyticsOnly()Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-eqz p2, :cond_0

    .line 51
    .line 52
    const-string p1, "CleverTap instance is configured to analytics only, not processing Variable response"

    .line 53
    .line 54
    invoke-direct {p0, p1}, Ll/yhi;->e(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    if-nez p1, :cond_1

    .line 59
    .line 60
    const-string p1, "Can\'t parse Variable Response, JSON response object is null"

    .line 61
    .line 62
    invoke-direct {p0, p1}, Ll/yhi;->e(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    invoke-direct {p0, p1}, Ll/yhi;->b(Lorg/json/JSONObject;)V

    .line 67
    .line 68
    .line 69
    invoke-direct {p0, p1}, Ll/yhi;->c(Lorg/json/JSONObject;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method
