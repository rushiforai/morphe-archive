.class Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$1;
.super Lsun/net/www/protocol/http/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler;->createURLStreamHandler(Ljava/lang/String;)Ljava/net/URLStreamHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$1;->this$0:Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Lsun/net/www/protocol/http/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public openConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$1;->openConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/URLConnection;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public openConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/URLConnection;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 7
    new-instance p2, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;

    invoke-direct {p2, p1, p0}, Lorg/fourthline/cling/transport/impl/FixedSunURLStreamHandler$UpnpURLConnection;-><init>(Ljava/net/URL;Lsun/net/www/protocol/http/Handler;)V

    return-object p2
.end method
