.class public interface abstract Lorg/eclipse/jetty/util/thread/ThreadPool$SizedThreadPool;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/thread/ThreadPool;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/thread/ThreadPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "SizedThreadPool"
.end annotation


# virtual methods
.method public abstract getMaxThreads()I
.end method

.method public abstract getMinThreads()I
.end method

.method public abstract setMaxThreads(I)V
.end method

.method public abstract setMinThreads(I)V
.end method
