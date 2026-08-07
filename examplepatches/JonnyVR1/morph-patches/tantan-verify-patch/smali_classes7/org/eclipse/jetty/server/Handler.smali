.class public interface abstract Lorg/eclipse/jetty/server/Handler;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/component/LifeCycle;
.implements Lorg/eclipse/jetty/util/component/Destroyable;


# virtual methods
.method public abstract destroy()V
.end method

.method public abstract getServer()Lorg/eclipse/jetty/server/Server;
.end method

.method public abstract handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation
.end method

.method public abstract setServer(Lorg/eclipse/jetty/server/Server;)V
.end method
