.class public interface abstract Lorg/eclipse/jetty/security/authentication/LoginCallback;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract clearPassword()V
.end method

.method public abstract getCredential()Ljava/lang/Object;
.end method

.method public abstract getRoles()[Ljava/lang/String;
.end method

.method public abstract getSubject()Ljavax/security/auth/Subject;
.end method

.method public abstract getUserName()Ljava/lang/String;
.end method

.method public abstract getUserPrincipal()Ljava/security/Principal;
.end method

.method public abstract isSuccess()Z
.end method

.method public abstract setRoles([Ljava/lang/String;)V
.end method

.method public abstract setSuccess(Z)V
.end method

.method public abstract setUserPrincipal(Ljava/security/Principal;)V
.end method
