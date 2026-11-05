.class public final Le/e/a/SecurityPolicy240;
.super Ljava/lang/Object;
.source "SecurityPolicy240.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cookie(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 30
    const-string v0, ""

    :try_start_2
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 31
    invoke-static {v1}, Le/e/a/SecurityPolicy240;->secure(Ljava/net/URL;)Z

    move-result p0

    if-nez p0, :cond_e

    return-object v0

    .line 32
    :cond_e
    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 33
    const-string v1, "domand.nicovideo.jp"

    invoke-static {p0, v1}, Le/e/a/SecurityPolicy240;->under(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 34
    invoke-static {p2}, Le/e/a/SecurityPolicy240;->delivery(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_2e

    invoke-static {p1}, Le/e/a/SecurityPolicy240;->delivery(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_2e
    return-object p0

    .line 37
    :cond_2f
    const-string p2, "nicovideo.jp"

    invoke-static {p0, p2}, Le/e/a/SecurityPolicy240;->under(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3b

    invoke-static {p1}, Le/e/a/SecurityPolicy240;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_3b} :catch_3c

    :cond_3b
    return-object v0

    .line 38
    :catch_3c
    move-exception p0

    return-object v0
.end method

.method static delivery(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 22
    invoke-static {p0}, Le/e/a/SecurityPolicy240;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, ";"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x0

    :goto_c
    if-lt v1, v0, :cond_11

    .line 26
    const-string p0, ""

    return-object p0

    .line 22
    :cond_11
    aget-object v2, p0, v1

    .line 23
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 24
    const-string v3, "domand_bid="

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0xb

    if-le v3, v4, :cond_28

    return-object v2

    .line 22
    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_c
.end method

.method static header(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 17
    const-string v0, ""

    if-eqz p0, :cond_2a

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x4000

    if-le v1, v2, :cond_d

    goto :goto_2a

    .line 18
    :cond_d
    const/4 v1, 0x0

    :goto_e
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v1, v2, :cond_15

    .line 19
    return-object p0

    .line 18
    :cond_15
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x20

    if-lt v2, v3, :cond_29

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x7f

    if-ne v2, v3, :cond_26

    goto :goto_29

    :cond_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_29
    :goto_29
    return-object v0

    .line 17
    :cond_2a
    :goto_2a
    return-object v0
.end method

.method public static requireApi(Ljava/lang/String;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 42
    invoke-static {v0}, Le/e/a/SecurityPolicy240;->secure(Ljava/net/URL;)Z

    move-result p0

    if-eqz p0, :cond_1e

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "nicovideo.jp"

    invoke-static {p0, v0}, Le/e/a/SecurityPolicy240;->under(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1e

    .line 44
    return-void

    .line 43
    :cond_1e
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Invalid authenticated API destination"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static secure(Ljava/net/URL;)Z
    .registers 3

    .line 13
    const-string v0, "https"

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_23

    .line 14
    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_21

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result p0

    const/16 v0, 0x1bb

    if-ne p0, v0, :cond_23

    .line 13
    :cond_21
    const/4 p0, 0x1

    return p0

    :cond_23
    const/4 p0, 0x0

    return p0
.end method

.method static under(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1d

    const/4 p0, 0x0

    return p0

    :cond_1d
    const/4 p0, 0x1

    return p0
.end method
