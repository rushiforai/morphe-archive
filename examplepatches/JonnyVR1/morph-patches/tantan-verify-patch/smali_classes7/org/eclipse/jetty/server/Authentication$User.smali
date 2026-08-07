.class public interface abstract Lorg/eclipse/jetty/server/Authentication$User;
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
    name = "User"
.end annotation


# virtual methods
.method public abstract getAuthMethod()Ljava/lang/String;
.end method

.method public abstract getUserIdentity()Lorg/eclipse/jetty/server/UserIdentity;
.end method

.method public abstract isUserInRole(Lorg/eclipse/jetty/server/UserIdentity$Scope;Ljava/lang/String;)Z
.end method

.method public abstract logout()V
.end method
