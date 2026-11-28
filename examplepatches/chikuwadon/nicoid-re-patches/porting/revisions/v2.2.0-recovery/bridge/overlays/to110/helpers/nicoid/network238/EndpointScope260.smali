.class public final Lnicoid/network238/EndpointScope260;
.super Ljava/lang/Object;
.source "EndpointScope260.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static read(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 4

    .line 6
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v1

    const/16 v2, 0x1bb

    if-ne v1, v2, :cond_1

    const-string v1, "nvapi.nicovideo.jp"

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->username()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->password()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->fragment()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 7
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object p0

    .line 8
    const-string v1, "/v1/search/video"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "/v2/users/[0-9]+/videos"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "/v1/users/me/following/users"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "/v1/users/me/ng-comments/client"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "/v1/users/me/watch/history"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 6
    :cond_1
    return v0
.end method
