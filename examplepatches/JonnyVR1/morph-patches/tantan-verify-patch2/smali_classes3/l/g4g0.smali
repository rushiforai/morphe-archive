.class public Ll/g4g0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static varargs a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 7
    .line 8
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 9
    .line 10
    iput-object p0, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p1, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p2, v0, Ll/q4f;->p:Ljava/lang/String;

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    iput p0, v0, Ll/q4f;->a:I

    .line 18
    .line 19
    invoke-static {p3}, Ll/g4g0;->b([Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iput-object p0, v0, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 24
    .line 25
    invoke-static {v0}, Ll/i4g0;->m(Ll/q4f;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static varargs b([Ljava/lang/Object;)Lorg/json/JSONObject;
    .locals 5

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x1

    .line 3
    and-int/2addr v0, v1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v1, v2

    .line 9
    :goto_0
    invoke-static {v1}, Ll/u11;->b(Z)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lorg/json/JSONObject;

    .line 13
    .line 14
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 15
    .line 16
    .line 17
    :goto_1
    array-length v1, p0

    .line 18
    if-ge v2, v1, :cond_3

    .line 19
    .line 20
    aget-object v1, p0, v2

    .line 21
    .line 22
    const-string v3, "null"

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    aput-object v3, p0, v2

    .line 27
    .line 28
    :cond_1
    add-int/lit8 v1, v2, 0x1

    .line 29
    .line 30
    aget-object v4, p0, v1

    .line 31
    .line 32
    if-nez v4, :cond_2

    .line 33
    .line 34
    aput-object v3, p0, v1

    .line 35
    .line 36
    :cond_2
    aget-object v3, p0, v2

    .line 37
    .line 38
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    aget-object v1, p0, v1

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    :try_start_0
    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    goto :goto_2

    .line 52
    :catch_0
    move-exception v1

    .line 53
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    :goto_2
    add-int/lit8 v2, v2, 0x2

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    return-object v0
.end method

.method public static varargs c(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 7
    .line 8
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 9
    .line 10
    iput-object p0, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 11
    .line 12
    const-string p0, ""

    .line 13
    .line 14
    iput-object p0, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    iput p0, v0, Ll/q4f;->a:I

    .line 18
    .line 19
    invoke-static {p1}, Ll/g4g0;->b([Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iput-object p0, v0, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 24
    .line 25
    invoke-static {v0}, Ll/i4g0;->m(Ll/q4f;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
