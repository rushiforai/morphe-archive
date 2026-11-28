.class public final Lnicoid/network238/EndpointScope259;
.super Ljava/lang/Object;
.source "EndpointScope259.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static base(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 3

    .line 5
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v0

    const/16 v1, 0x1bb

    if-ne v0, v1, :cond_0

    const-string v0, "nvapi.nicovideo.jp"

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->username()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->password()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->fragment()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static historyDelete(Lnicoid/network238/okhttp3/HttpUrl;Z)Z
    .registers 4

    .line 7
    const/4 v0, 0x0

    if-nez p1, :cond_0

    invoke-static {p0}, Lnicoid/network238/EndpointScope259;->base(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object p1

    const-string v1, "/v2/users/me/watch/history"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->querySize()I

    move-result p1

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    const-string p1, "target"

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl;->queryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string p1, "[A-Za-z0-9]+"

    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    move v0, v1

    :cond_0
    return v0
.end method

.method public static read(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 3

    .line 6
    invoke-static {p0}, Lnicoid/network238/EndpointScope259;->base(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "/v2/users/me/watch/history"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "/v2/mylists/[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "/v1/users/me/following/mylists(?:/[0-9]+)?"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    :cond_1
    :goto_0
    return v1
.end method
