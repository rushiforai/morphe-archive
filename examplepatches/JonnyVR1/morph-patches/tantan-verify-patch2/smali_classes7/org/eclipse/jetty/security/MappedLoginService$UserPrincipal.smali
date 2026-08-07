.class public interface abstract Lorg/eclipse/jetty/security/MappedLoginService$UserPrincipal;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/security/Principal;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/security/MappedLoginService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "UserPrincipal"
.end annotation


# virtual methods
.method public abstract authenticate(Ljava/lang/Object;)Z
.end method

.method public abstract isAuthenticated()Z
.end method
