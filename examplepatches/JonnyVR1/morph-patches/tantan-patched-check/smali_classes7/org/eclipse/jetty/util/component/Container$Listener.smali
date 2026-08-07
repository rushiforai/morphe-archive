.class public interface abstract Lorg/eclipse/jetty/util/component/Container$Listener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/EventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/component/Container;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation


# virtual methods
.method public abstract add(Lorg/eclipse/jetty/util/component/Container$Relationship;)V
.end method

.method public abstract addBean(Ljava/lang/Object;)V
.end method

.method public abstract remove(Lorg/eclipse/jetty/util/component/Container$Relationship;)V
.end method

.method public abstract removeBean(Ljava/lang/Object;)V
.end method
