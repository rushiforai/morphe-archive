.class public Lorg/seamless/http/HttpFetch;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/seamless/http/HttpFetch$RepresentationFactory;
    }
.end annotation


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

.method public static fetch(Ljava/net/URL;IILorg/seamless/http/HttpFetch$RepresentationFactory;)Lorg/seamless/http/Representation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/net/URL;",
            "II",
            "Lorg/seamless/http/HttpFetch$RepresentationFactory<",
            "TE;>;)",
            "Lorg/seamless/http/Representation<",
            "TE;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 77
    const-string v0, "GET"

    invoke-static {p0, v0, p1, p2, p3}, Lorg/seamless/http/HttpFetch;->fetch(Ljava/net/URL;Ljava/lang/String;IILorg/seamless/http/HttpFetch$RepresentationFactory;)Lorg/seamless/http/Representation;

    move-result-object p0

    return-object p0
.end method

.method public static fetch(Ljava/net/URL;Ljava/lang/String;IILorg/seamless/http/HttpFetch$RepresentationFactory;)Lorg/seamless/http/Representation;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/net/URL;",
            "Ljava/lang/String;",
            "II",
            "Lorg/seamless/http/HttpFetch$RepresentationFactory<",
            "TE;>;)",
            "Lorg/seamless/http/Representation<",
            "TE;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "Fetching resource failed, returned status code: "

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    :try_start_1
    invoke-virtual {p0, p1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p3}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {p4, p0, v1}, Lorg/seamless/http/HttpFetch$RepresentationFactory;->createRepresentation(Ljava/net/URLConnection;Ljava/io/InputStream;)Lorg/seamless/http/Representation;

    .line 24
    .line 25
    .line 26
    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-object p0

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    goto :goto_1

    .line 35
    :catch_0
    move-exception p1

    .line 36
    move-object v2, v1

    .line 37
    move-object v1, p0

    .line 38
    move-object p0, v2

    .line 39
    goto :goto_0

    .line 40
    :catch_1
    move-exception p1

    .line 41
    move-object p0, v1

    .line 42
    :goto_0
    if-eqz v1, :cond_1

    .line 43
    .line 44
    :try_start_2
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    new-instance p2, Ljava/io/IOException;

    .line 49
    .line 50
    new-instance p3, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    throw p2

    .line 66
    :catchall_1
    move-exception p1

    .line 67
    move-object v1, p0

    .line 68
    move-object p0, p1

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 71
    :goto_1
    if-eqz v1, :cond_2

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 74
    .line 75
    .line 76
    :cond_2
    throw p0
.end method

.method public static fetchBinary(Ljava/net/URL;)Lorg/seamless/http/Representation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            ")",
            "Lorg/seamless/http/Representation<",
            "[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x1f4

    .line 11
    invoke-static {p0, v0, v0}, Lorg/seamless/http/HttpFetch;->fetchBinary(Ljava/net/URL;II)Lorg/seamless/http/Representation;

    move-result-object p0

    return-object p0
.end method

.method public static fetchBinary(Ljava/net/URL;II)Lorg/seamless/http/Representation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "II)",
            "Lorg/seamless/http/Representation<",
            "[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/seamless/http/HttpFetch$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/seamless/http/HttpFetch$1;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p1, p2, v0}, Lorg/seamless/http/HttpFetch;->fetch(Ljava/net/URL;IILorg/seamless/http/HttpFetch$RepresentationFactory;)Lorg/seamless/http/Representation;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static fetchString(Ljava/net/URL;II)Lorg/seamless/http/Representation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "II)",
            "Lorg/seamless/http/Representation<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/seamless/http/HttpFetch$2;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/seamless/http/HttpFetch$2;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p1, p2, v0}, Lorg/seamless/http/HttpFetch;->fetch(Ljava/net/URL;IILorg/seamless/http/HttpFetch$RepresentationFactory;)Lorg/seamless/http/Representation;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static validate(Ljava/net/URL;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/seamless/http/HttpFetch$3;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/seamless/http/HttpFetch$3;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "HEAD"

    .line 7
    .line 8
    const/16 v2, 0x1f4

    .line 9
    .line 10
    invoke-static {p0, v1, v2, v2, v0}, Lorg/seamless/http/HttpFetch;->fetch(Ljava/net/URL;Ljava/lang/String;IILorg/seamless/http/HttpFetch$RepresentationFactory;)Lorg/seamless/http/Representation;

    .line 11
    .line 12
    .line 13
    return-void
.end method
