.class public interface abstract Lorg/eclipse/jetty/servlet/ServletContextHandler$Decorator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/servlet/ServletContextHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Decorator"
.end annotation


# virtual methods
.method public abstract decorateFilterHolder(Lorg/eclipse/jetty/servlet/FilterHolder;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation
.end method

.method public abstract decorateFilterInstance(Ll/gli;)Ll/gli;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ll/gli;",
            ">(TT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation
.end method

.method public abstract decorateListenerInstance(Ljava/util/EventListener;)Ljava/util/EventListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/util/EventListener;",
            ">(TT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation
.end method

.method public abstract decorateServletHolder(Lorg/eclipse/jetty/servlet/ServletHolder;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation
.end method

.method public abstract decorateServletInstance(Ll/yre0;)Ll/yre0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ll/yre0;",
            ">(TT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation
.end method

.method public abstract destroyFilterInstance(Ll/gli;)V
.end method

.method public abstract destroyListenerInstance(Ljava/util/EventListener;)V
.end method

.method public abstract destroyServletInstance(Ll/yre0;)V
.end method
