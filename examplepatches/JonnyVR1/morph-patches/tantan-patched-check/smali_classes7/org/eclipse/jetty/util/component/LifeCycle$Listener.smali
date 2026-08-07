.class public interface abstract Lorg/eclipse/jetty/util/component/LifeCycle$Listener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/EventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/component/LifeCycle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation


# virtual methods
.method public abstract lifeCycleFailure(Lorg/eclipse/jetty/util/component/LifeCycle;Ljava/lang/Throwable;)V
.end method

.method public abstract lifeCycleStarted(Lorg/eclipse/jetty/util/component/LifeCycle;)V
.end method

.method public abstract lifeCycleStarting(Lorg/eclipse/jetty/util/component/LifeCycle;)V
.end method

.method public abstract lifeCycleStopped(Lorg/eclipse/jetty/util/component/LifeCycle;)V
.end method

.method public abstract lifeCycleStopping(Lorg/eclipse/jetty/util/component/LifeCycle;)V
.end method
