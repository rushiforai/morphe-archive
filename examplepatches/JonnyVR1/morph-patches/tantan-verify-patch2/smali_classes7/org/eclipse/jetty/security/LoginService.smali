.class public interface abstract Lorg/eclipse/jetty/security/LoginService;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract getIdentityService()Lorg/eclipse/jetty/security/IdentityService;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract login(Ljava/lang/String;Ljava/lang/Object;)Lorg/eclipse/jetty/server/UserIdentity;
.end method

.method public abstract logout(Lorg/eclipse/jetty/server/UserIdentity;)V
.end method

.method public abstract setIdentityService(Lorg/eclipse/jetty/security/IdentityService;)V
.end method

.method public abstract validate(Lorg/eclipse/jetty/server/UserIdentity;)Z
.end method
