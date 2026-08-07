.class Lorg/eclipse/jetty/server/handler/GzipHandler$2$1;
.super Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/server/handler/GzipHandler$2;->newCompressedStream(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;JII)Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jetty/server/handler/GzipHandler$2;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/handler/GzipHandler$2;Ljava/lang/String;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;JII)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/handler/GzipHandler$2$1;->this$1:Lorg/eclipse/jetty/server/handler/GzipHandler$2;

    .line 2
    .line 3
    move-object p1, p2

    .line 4
    move-object p2, p3

    .line 5
    move-object p3, p4

    .line 6
    move-wide p4, p5

    .line 7
    move p6, p7

    .line 8
    move p7, p8

    .line 9
    invoke-direct/range {p0 .. p7}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;-><init>(Ljava/lang/String;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;JII)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public createStream()Ljava/util/zip/DeflaterOutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/zip/GZIPOutputStream;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_response:Ljavax/servlet/http/HttpServletResponse;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/lse0;->getOutputStream()Ll/ese0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget p0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bufferSize:I

    .line 10
    .line 11
    invoke-direct {v0, v1, p0}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method
