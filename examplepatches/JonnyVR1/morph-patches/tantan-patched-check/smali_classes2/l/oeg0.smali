.class public abstract Ll/oeg0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ljava/lang/Throwable;)I
    .locals 2

    .line 1
    instance-of v0, p0, Ljava/net/SocketTimeoutException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/16 p0, -0x28a2

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    instance-of v0, p0, Ljava/io/InterruptedIOException;

    .line 9
    .line 10
    if-nez v0, :cond_6

    .line 11
    .line 12
    instance-of v0, p0, Ljava/net/SocketException;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    instance-of v0, p0, Ljavax/net/ssl/SSLHandshakeException;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    const/16 p0, -0x28a4

    .line 22
    .line 23
    return p0

    .line 24
    :cond_2
    instance-of v0, p0, Ljava/net/UnknownHostException;

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    const/16 p0, -0x28a5

    .line 29
    .line 30
    return p0

    .line 31
    :cond_3
    instance-of v0, p0, Ljava/net/ConnectException;

    .line 32
    .line 33
    const/16 v1, -0x28a6

    .line 34
    .line 35
    if-eqz v0, :cond_4

    .line 36
    .line 37
    return v1

    .line 38
    :cond_4
    instance-of p0, p0, Ljavax/net/ssl/SSLException;

    .line 39
    .line 40
    if-eqz p0, :cond_5

    .line 41
    .line 42
    return v1

    .line 43
    :cond_5
    const/4 p0, -0x1

    .line 44
    return p0

    .line 45
    :cond_6
    :goto_0
    const/16 p0, -0x28a3

    .line 46
    .line 47
    return p0
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "retCode"

    .line 7
    .line 8
    const/4 v2, -0x1

    .line 9
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 10
    .line 11
    .line 12
    const-string v1, "retMsg"

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    return-object p0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method
