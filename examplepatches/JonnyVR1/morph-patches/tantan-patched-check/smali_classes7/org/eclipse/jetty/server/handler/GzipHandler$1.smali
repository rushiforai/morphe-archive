.class Lorg/eclipse/jetty/server/handler/GzipHandler$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/continuation/ContinuationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/server/handler/GzipHandler;->handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/handler/GzipHandler;

.field final synthetic val$wrappedResponse:Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/handler/GzipHandler;Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/handler/GzipHandler$1;->this$0:Lorg/eclipse/jetty/server/handler/GzipHandler;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/eclipse/jetty/server/handler/GzipHandler$1;->val$wrappedResponse:Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onComplete(Lorg/eclipse/jetty/continuation/Continuation;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/GzipHandler$1;->val$wrappedResponse:Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->finish()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-static {}, Lorg/eclipse/jetty/server/handler/GzipHandler;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onTimeout(Lorg/eclipse/jetty/continuation/Continuation;)V
    .locals 0

    return-void
.end method
