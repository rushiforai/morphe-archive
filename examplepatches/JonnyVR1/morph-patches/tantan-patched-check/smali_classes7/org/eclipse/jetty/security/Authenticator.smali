.class public interface abstract Lorg/eclipse/jetty/security/Authenticator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/security/Authenticator$Factory;,
        Lorg/eclipse/jetty/security/Authenticator$AuthConfiguration;
    }
.end annotation


# virtual methods
.method public abstract getAuthMethod()Ljava/lang/String;
.end method

.method public abstract secureResponse(Ll/gse0;Ll/lse0;ZLorg/eclipse/jetty/server/Authentication$User;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jetty/security/ServerAuthException;
        }
    .end annotation
.end method

.method public abstract setConfiguration(Lorg/eclipse/jetty/security/Authenticator$AuthConfiguration;)V
.end method

.method public abstract validateRequest(Ll/gse0;Ll/lse0;Z)Lorg/eclipse/jetty/server/Authentication;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jetty/security/ServerAuthException;
        }
    .end annotation
.end method
