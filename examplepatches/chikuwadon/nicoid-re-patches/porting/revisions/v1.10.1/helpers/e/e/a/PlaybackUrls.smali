.class public final Le/e/a/PlaybackUrls;
.super Ljava/lang/Object;
.source "PlaybackUrls.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static directHls(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 8
    const-string v0, "/https://"

    if-nez p0, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    :try_start_6
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    const-string v3, "http"

    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6a

    invoke-virtual {v1}, Ljava/net/URI;->getPort()I

    move-result v3

    const v4, 0xce7e

    if-ne v3, v4, :cond_6a

    const-string v3, "127.0.0.1"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_35

    const-string v3, "localhost"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_35

    goto :goto_6a

    :cond_35
    invoke-virtual {v1}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6a

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_42

    goto :goto_6a

    :cond_42
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    const-string v2, "https"

    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6c

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6c

    invoke-static {v0}, Le/e/a/PlaybackUrls;->isHls(Ljava/lang/String;)Z

    move-result v1
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_67} :catch_6b

    if-eqz v1, :cond_6c

    return-object v0

    :cond_6a
    :goto_6a
    return-object p0

    :catch_6b
    move-exception v0

    :cond_6c
    return-object p0
.end method

.method public static isHls(Ljava/lang/String;)Z
    .registers 3

    .line 7
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    :cond_4
    :try_start_4
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1f

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v1, ".m3u8"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_1b} :catch_20

    if-eqz p0, :cond_1f

    const/4 p0, 0x1

    return p0

    :cond_1f
    return v0

    :catch_20
    move-exception p0

    return v0
.end method
