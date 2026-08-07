.class public interface abstract Lorg/eclipse/jetty/server/HandlerContainer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/component/LifeCycle;


# virtual methods
.method public abstract getChildHandlerByClass(Ljava/lang/Class;)Lorg/eclipse/jetty/server/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/eclipse/jetty/server/Handler;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation
.end method

.method public abstract getChildHandlers()[Lorg/eclipse/jetty/server/Handler;
.end method

.method public abstract getChildHandlersByClass(Ljava/lang/Class;)[Lorg/eclipse/jetty/server/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)[",
            "Lorg/eclipse/jetty/server/Handler;"
        }
    .end annotation
.end method

.method public abstract getHandlers()[Lorg/eclipse/jetty/server/Handler;
.end method
