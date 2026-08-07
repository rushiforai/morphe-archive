.class Lorg/eclipse/jetty/server/handler/ShutdownHandler$1;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/server/handler/ShutdownHandler;->handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/handler/ShutdownHandler;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/handler/ShutdownHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/handler/ShutdownHandler$1;->this$0:Lorg/eclipse/jetty/server/handler/ShutdownHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ShutdownHandler$1;->this$0:Lorg/eclipse/jetty/server/handler/ShutdownHandler;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->access$000(Lorg/eclipse/jetty/server/handler/ShutdownHandler;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    const-string v0, "Shutting down server"

    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_1
    move-exception p0

    .line 15
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
