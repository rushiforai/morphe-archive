.class public interface abstract Lorg/eclipse/jetty/io/NetworkTrafficListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/io/NetworkTrafficListener$Empty;
    }
.end annotation


# virtual methods
.method public abstract closed(Ljava/net/Socket;)V
.end method

.method public abstract incoming(Ljava/net/Socket;Lorg/eclipse/jetty/io/Buffer;)V
.end method

.method public abstract opened(Ljava/net/Socket;)V
.end method

.method public abstract outgoing(Ljava/net/Socket;Lorg/eclipse/jetty/io/Buffer;)V
.end method
