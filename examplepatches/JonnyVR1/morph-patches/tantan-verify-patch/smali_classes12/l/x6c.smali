.class public Ll/x6c;
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

.method private static a()Lorg/json/JSONObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gqw;->d()Ll/tof0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0}, Ll/fqw$b;->a()Lorg/json/JSONObject;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    .line 13
    .line 14
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 15
    .line 16
    .line 17
    :goto_0
    const-string v1, "log_t"

    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method private static b(Ljava/util/List;)Lorg/json/JSONArray;
    .locals 3
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hqw;",
            ">;)",
            "Lorg/json/JSONArray;"
        }
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/hqw;

    .line 21
    .line 22
    new-instance v2, Lorg/json/JSONObject;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/hqw;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    return-object v0

    .line 36
    :catch_0
    move-exception p0

    .line 37
    invoke-static {p0}, Ll/gqw;->u(Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    new-instance p0, Lorg/json/JSONArray;

    .line 41
    .line 42
    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    .line 43
    .line 44
    .line 45
    return-object p0
.end method

.method public static c(Ljava/util/List;)Lorg/json/JSONObject;
    .locals 2
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hqw;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/x6c;->a()Lorg/json/JSONObject;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "list"

    .line 6
    .line 7
    invoke-static {p0}, Ll/x6c;->b(Ljava/util/List;)Lorg/json/JSONArray;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static d(Ll/fzv;)Ll/hqw;
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ll/hqw;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hqw;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/fzv;->b:Ll/nqw;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/hqw;->e(Ll/nqw;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/fzv;->a:Ll/nqw;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/hqw;->a(Ll/nqw;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/fzv;->business:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/hqw;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/fzv;->secondLBusiness:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/hqw;->c(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/fzv;->thirdLBusiness:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ll/hqw;->d(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    return-object v0

    .line 32
    :catch_0
    move-exception p0

    .line 33
    invoke-static {p0}, Ll/gqw;->u(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method
