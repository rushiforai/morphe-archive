.class Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;
.super Lsun/net/www/protocol/http/HttpURLConnection;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UpnpURLConnection"
.end annotation


# static fields
.field private static final methods:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    const-string v7, "UNSUBSCRIBE"

    .line 2
    .line 3
    const-string v8, "NOTIFY"

    .line 4
    .line 5
    const-string v0, "GET"

    .line 6
    .line 7
    const-string v1, "POST"

    .line 8
    .line 9
    const-string v2, "HEAD"

    .line 10
    .line 11
    const-string v3, "OPTIONS"

    .line 12
    .line 13
    const-string v4, "PUT"

    .line 14
    .line 15
    const-string v5, "DELETE"

    .line 16
    .line 17
    const-string v6, "SUBSCRIBE"

    .line 18
    .line 19
    filled-new-array/range {v0 .. v8}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;->methods:[Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 5
    invoke-direct {p0, p1, p2, p3}, Lsun/net/www/protocol/http/HttpURLConnection;-><init>(Ljava/net/URL;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Lsun/net/www/protocol/http/Handler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lsun/net/www/protocol/http/HttpURLConnection;-><init>(Ljava/net/URL;Lsun/net/www/protocol/http/Handler;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public declared-synchronized getOutputStream()Ljava/io/OutputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;->method:Ljava/lang/String;

    .line 3
    .line 4
    iget-object v1, p0, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;->method:Ljava/lang/String;

    .line 5
    .line 6
    const-string v2, "PUT"

    .line 7
    .line 8
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;->method:Ljava/lang/String;

    .line 15
    .line 16
    const-string v2, "POST"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    iget-object v1, p0, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;->method:Ljava/lang/String;

    .line 25
    .line 26
    const-string v2, "NOTIFY"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const-string v1, "GET"

    .line 36
    .line 37
    iput-object v1, p0, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;->method:Ljava/lang/String;

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    :goto_0
    const-string v1, "PUT"

    .line 43
    .line 44
    iput-object v1, p0, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;->method:Ljava/lang/String;

    .line 45
    .line 46
    :goto_1
    invoke-super {p0}, Lsun/net/www/protocol/http/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v0, p0, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;->method:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    monitor-exit p0

    .line 53
    return-object v1

    .line 54
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    throw v0
.end method

.method public setRequestMethod(Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/ProtocolException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;->connected:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    sget-object v0, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;->methods:[Ljava/lang/String;

    .line 6
    .line 7
    array-length v1, v0

    .line 8
    const/4 v2, 0x0

    .line 9
    :goto_0
    if-ge v2, v1, :cond_1

    .line 10
    .line 11
    aget-object v3, v0, v2

    .line 12
    .line 13
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    iput-object p1, p0, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;->method:Ljava/lang/String;

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    new-instance p0, Ljava/net/ProtocolException;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v1, "Invalid UPnP HTTP method: "

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-direct {p0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw p0

    .line 45
    :cond_2
    const-string p0, "Cannot reset method once connected"

    .line 46
    .line 47
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
