.class public interface abstract Lorg/eclipse/jetty/server/Authentication$Deferred;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/server/Authentication;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/Authentication;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Deferred"
.end annotation


# virtual methods
.method public abstract authenticate(Ll/gse0;)Lorg/eclipse/jetty/server/Authentication;
.end method

.method public abstract authenticate(Ll/gse0;Ll/lse0;)Lorg/eclipse/jetty/server/Authentication;
.end method

.method public abstract login(Ljava/lang/String;Ljava/lang/Object;Ll/gse0;)Lorg/eclipse/jetty/server/Authentication;
.end method
