.class public final Le/e/a/SessionCookies194;
.super Ljava/lang/Object;
.source "SessionCookies194.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static authenticated(Ljava/lang/String;)Z
    .registers 9
    .param p0, "header"    # Ljava/lang/String;

    .line 25
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    :cond_4
    const-string v1, ";"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_c
    if-ge v3, v2, :cond_3d

    aget-object v4, v1, v3

    .local v4, "part":Ljava/lang/String;
    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .local v5, "i":I
    if-ltz v5, :cond_3a

    invoke-virtual {v4, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string v7, "user_session"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3a

    add-int/lit8 v6, v5, 0x1

    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_3a

    const/4 v0, 0x1

    return v0

    .end local v4    # "part":Ljava/lang/String;
    .end local v5    # "i":I
    :cond_3a
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    :cond_3d
    return v0
.end method

.method public static cookie(Landroid/content/Context;Ljava/lang/Object;)Ljava/lang/String;
    .registers 15
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "preferred"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 10
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 11
    .local v0, "p":Landroid/content/SharedPreferences;
    const-string v1, "nologin"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_10

    const-string v1, ""

    return-object v1

    .line 12
    :cond_10
    const-string v1, "e.e.a.v0"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .local v1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "org.apache.http.client.CookieStore"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 13
    .local v3, "store":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "a"

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Class;

    aput-object v3, v6, v2

    invoke-virtual {v1, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 14
    .local v4, "serialize":Ljava/lang/reflect/Method;
    monitor-enter v1

    .line 15
    :try_start_28
    const-string v6, "nologin"

    invoke-interface {v0, v6, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_34

    const-string v2, ""

    monitor-exit v1

    return-object v2

    .line 16
    :cond_34
    invoke-static {v4, p1}, Le/e/a/SessionCookies194;->header(Ljava/lang/reflect/Method;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .local v6, "value":Ljava/lang/String;
    invoke-static {v6}, Le/e/a/SessionCookies194;->authenticated(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_40

    monitor-exit v1

    return-object v6

    .line 17
    :cond_40
    const-string v7, "b"

    invoke-virtual {v1, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .local v7, "field":Ljava/lang/reflect/Field;
    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v4, v9}, Le/e/a/SessionCookies194;->header(Ljava/lang/reflect/Method;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .end local v6    # "value":Ljava/lang/String;
    .local v9, "value":Ljava/lang/String;
    invoke-static {v9}, Le/e/a/SessionCookies194;->authenticated(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_57

    monitor-exit v1

    return-object v9

    .line 18
    :cond_57
    const-string v6, "save_cookie"

    const-string v10, ""

    invoke-interface {v0, v6, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .local v6, "saved":Ljava/lang/String;
    invoke-static {v6}, Le/e/a/SessionCookies194;->authenticated(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_69

    const-string v2, ""

    monitor-exit v1

    return-object v2

    .line 19
    :cond_69
    const-string v10, "b"

    new-array v11, v5, [Ljava/lang/Class;

    const-class v12, Ljava/lang/String;

    aput-object v12, v11, v2

    invoke-virtual {v1, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v6, v5, v2

    invoke-virtual {v10, v8, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .local v5, "restored":Ljava/lang/Object;
    invoke-static {v4, v5}, Le/e/a/SessionCookies194;->header(Ljava/lang/reflect/Method;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 20
    .end local v9    # "value":Ljava/lang/String;
    .local v10, "value":Ljava/lang/String;
    invoke-static {v10}, Le/e/a/SessionCookies194;->authenticated(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_95

    const-string v9, "nologin"

    invoke-interface {v0, v9, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_90

    goto :goto_95

    .line 21
    :cond_90
    invoke-virtual {v7, v8, v5}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    monitor-exit v1

    return-object v10

    .line 20
    :cond_95
    :goto_95
    const-string v2, ""

    monitor-exit v1

    return-object v2

    .line 22
    .end local v5    # "restored":Ljava/lang/Object;
    .end local v6    # "saved":Ljava/lang/String;
    .end local v7    # "field":Ljava/lang/reflect/Field;
    .end local v10    # "value":Ljava/lang/String;
    :catchall_99
    move-exception v2

    monitor-exit v1
    :try_end_9b
    .catchall {:try_start_28 .. :try_end_9b} :catchall_99

    throw v2
.end method

.method private static header(Ljava/lang/reflect/Method;Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .param p1, "store"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 24
    if-nez p1, :cond_5

    const-string v0, ""

    goto :goto_12

    :cond_5
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_12
    return-object v0
.end method
