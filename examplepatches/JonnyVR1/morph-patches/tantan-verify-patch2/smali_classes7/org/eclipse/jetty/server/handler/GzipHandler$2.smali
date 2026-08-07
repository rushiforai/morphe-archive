.class Lorg/eclipse/jetty/server/handler/GzipHandler$2;
.super Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/server/handler/GzipHandler;->newGzipResponseWrapper(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/handler/GzipHandler;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/handler/GzipHandler;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/handler/GzipHandler$2;->this$0:Lorg/eclipse/jetty/server/handler/GzipHandler;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;-><init>(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p1, Lorg/eclipse/jetty/server/handler/GzipHandler;->_mimeTypes:Ljava/util/Set;

    .line 7
    .line 8
    invoke-super {p0, p2}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->setMimeTypes(Ljava/util/Set;)V

    .line 9
    .line 10
    .line 11
    iget p2, p1, Lorg/eclipse/jetty/server/handler/GzipHandler;->_bufferSize:I

    .line 12
    .line 13
    invoke-super {p0, p2}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->setBufferSize(I)V

    .line 14
    .line 15
    .line 16
    iget p1, p1, Lorg/eclipse/jetty/server/handler/GzipHandler;->_minGzipSize:I

    .line 17
    .line 18
    invoke-super {p0, p1}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->setMinCompressSize(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public newCompressedStream(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;JII)Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/eclipse/jetty/server/handler/GzipHandler$2$1;

    .line 2
    .line 3
    const-string v2, "gzip"

    .line 4
    .line 5
    move-object v1, p0

    .line 6
    move-object v3, p1

    .line 7
    move-object v4, p2

    .line 8
    move-wide v5, p3

    .line 9
    move v7, p5

    .line 10
    move v8, p6

    .line 11
    invoke-direct/range {v0 .. v8}, Lorg/eclipse/jetty/server/handler/GzipHandler$2$1;-><init>(Lorg/eclipse/jetty/server/handler/GzipHandler$2;Ljava/lang/String;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;JII)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public newWriter(Ljava/io/OutputStream;Ljava/lang/String;)Ljava/io/PrintWriter;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/GzipHandler$2;->this$0:Lorg/eclipse/jetty/server/handler/GzipHandler;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/server/handler/GzipHandler;->newWriter(Ljava/io/OutputStream;Ljava/lang/String;)Ljava/io/PrintWriter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
