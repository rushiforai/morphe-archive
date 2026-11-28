.class public final Lnicoid/network238/CookiePolicy278;
.super Ljava/lang/Object;
.source "CookiePolicy278.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static match(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/util/Date;)Lnicoid/network238/okhttp3/Cookie;
    .registers 12

    .line 11
    const/4 v0, 0x0

    if-eqz p0, :cond_a

    invoke-static {p1}, Lnicoid/network238/CookiePolicy278;->safeName(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-static {p2}, Lnicoid/network238/CookiePolicy278;->safeValue(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    if-eqz p3, :cond_a

    .line 12
    const-string v1, "."

    invoke-virtual {p3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {p3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p3

    :cond_0
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p3, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p3

    .line 13
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "nicovideo.jp"

    invoke-virtual {v3, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    return-object v0

    .line 14
    :cond_1
    if-nez v1, :cond_2

    if-nez p5, :cond_2

    const/4 v2, 0x0

    :cond_2
    if-nez v2, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p5, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-nez p5, :cond_3

    return-object v0

    .line 15
    :cond_3
    :try_start_0
    new-instance p5, Lnicoid/network238/okhttp3/Cookie$Builder;

    invoke-direct {p5}, Lnicoid/network238/okhttp3/Cookie$Builder;-><init>()V

    invoke-virtual {p5, p1}, Lnicoid/network238/okhttp3/Cookie$Builder;->name(Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/Cookie$Builder;->value(Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie$Builder;

    move-result-object p1

    if-eqz v2, :cond_4

    invoke-virtual {p1, p3}, Lnicoid/network238/okhttp3/Cookie$Builder;->domain(Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie$Builder;

    goto :goto_0

    :cond_4
    invoke-virtual {p1, p3}, Lnicoid/network238/okhttp3/Cookie$Builder;->hostOnlyDomain(Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie$Builder;

    :goto_0
    if-eqz p4, :cond_5

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_6

    :cond_5
    const-string p4, "/"

    :cond_6
    invoke-virtual {p1, p4}, Lnicoid/network238/okhttp3/Cookie$Builder;->path(Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie$Builder;

    if-eqz p6, :cond_7

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cookie$Builder;->secure()Lnicoid/network238/okhttp3/Cookie$Builder;

    :cond_7
    if-eqz p7, :cond_8

    invoke-virtual {p7}, Ljava/util/Date;->getTime()J

    move-result-wide p2

    invoke-virtual {p1, p2, p3}, Lnicoid/network238/okhttp3/Cookie$Builder;->expiresAt(J)Lnicoid/network238/okhttp3/Cookie$Builder;

    :cond_8
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cookie$Builder;->build()Lnicoid/network238/okhttp3/Cookie;

    move-result-object p1

    invoke-virtual {p1, p0}, Lnicoid/network238/okhttp3/Cookie;->matches(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_9

    move-object v0, p1

    goto :goto_1

    :catch_0
    move-exception p0

    :cond_9
    :goto_1
    return-object v0

    .line 11
    :cond_a
    return-object v0
.end method

.method static safeName(Ljava/lang/String;)Z
    .registers 2

    .line 8
    if-eqz p0, :cond_0

    const-string v0, "[!#$%&\'*+.^_`|~0-9A-Za-z-]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static safeValue(Ljava/lang/String;)Z
    .registers 5

    .line 9
    const/4 v0, 0x0

    if-eqz p0, :cond_0

    move v1, v0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x21

    if-lt v2, v3, :cond_0

    const/16 v3, 0x7e

    if-gt v2, v3, :cond_0

    const/16 v3, 0x22

    if-eq v2, v3, :cond_0

    const/16 v3, 0x2c

    if-eq v2, v3, :cond_0

    const/16 v3, 0x3b

    if-eq v2, v3, :cond_0

    const/16 v3, 0x5c

    if-eq v2, v3, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return v0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method
