.class public Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/http/HttpContent;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/http/HttpContent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ResourceAsHttpContent"
.end annotation


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field final _maxBuffer:I

.field final _mimeType:Lorg/eclipse/jetty/io/Buffer;

.field final _resource:Lorg/eclipse/jetty/util/resource/Resource;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/util/resource/Resource;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_mimeType:Lorg/eclipse/jetty/io/Buffer;

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_maxBuffer:I

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/util/resource/Resource;Lorg/eclipse/jetty/io/Buffer;I)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 14
    iput-object p2, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_mimeType:Lorg/eclipse/jetty/io/Buffer;

    .line 15
    iput p3, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_maxBuffer:I

    return-void
.end method


# virtual methods
.method public getContentLength()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/resource/Resource;->length()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getContentType()Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_mimeType:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDirectBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getIndirectBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 6

    .line 1
    const-string v0, "Couldn\'t close inputStream. Possible file handle leak"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 5
    .line 6
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/resource/Resource;->length()J

    .line 7
    .line 8
    .line 9
    move-result-wide v2

    .line 10
    const-wide/16 v4, 0x0

    .line 11
    .line 12
    cmp-long v2, v2, v4

    .line 13
    .line 14
    if-lez v2, :cond_2

    .line 15
    .line 16
    iget v2, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_maxBuffer:I

    .line 17
    .line 18
    int-to-long v2, v2

    .line 19
    iget-object v4, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 20
    .line 21
    invoke-virtual {v4}, Lorg/eclipse/jetty/util/resource/Resource;->length()J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    cmp-long v2, v2, v4

    .line 26
    .line 27
    if-gez v2, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance v2, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 31
    .line 32
    iget-object v3, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 33
    .line 34
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/resource/Resource;->length()J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    long-to-int v3, v3

    .line 39
    invoke-direct {v2, v3}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(I)V

    .line 40
    .line 41
    .line 42
    iget-object v3, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 43
    .line 44
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/resource/Resource;->getInputStream()Ljava/io/InputStream;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 49
    .line 50
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/resource/Resource;->length()J

    .line 51
    .line 52
    .line 53
    move-result-wide v3

    .line 54
    long-to-int p0, v3

    .line 55
    invoke-virtual {v2, v1, p0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;->readFrom(Ljava/io/InputStream;I)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .line 57
    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 61
    .line 62
    .line 63
    return-object v2

    .line 64
    :catch_0
    move-exception p0

    .line 65
    sget-object v1, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 66
    .line 67
    invoke-interface {v1, v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-object v2

    .line 71
    :catchall_0
    move-exception p0

    .line 72
    goto :goto_2

    .line 73
    :catch_1
    move-exception p0

    .line 74
    goto :goto_1

    .line 75
    :cond_2
    :goto_0
    return-object v1

    .line 76
    :goto_1
    :try_start_2
    new-instance v2, Ljava/lang/RuntimeException;

    .line 77
    .line 78
    invoke-direct {v2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 82
    :goto_2
    if-eqz v1, :cond_3

    .line 83
    .line 84
    :try_start_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 85
    .line 86
    .line 87
    goto :goto_3

    .line 88
    :catch_2
    move-exception v1

    .line 89
    sget-object v2, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 90
    .line 91
    invoke-interface {v2, v0, v1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    :cond_3
    :goto_3
    throw p0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/resource/Resource;->getInputStream()Ljava/io/InputStream;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLastModified()Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getResource()Lorg/eclipse/jetty/util/resource/Resource;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    return-object p0
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/resource/Resource;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
