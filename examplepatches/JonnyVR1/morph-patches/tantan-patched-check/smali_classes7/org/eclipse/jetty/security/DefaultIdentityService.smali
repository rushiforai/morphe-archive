.class public Lorg/eclipse/jetty/security/DefaultIdentityService;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/security/IdentityService;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public associate(Lorg/eclipse/jetty/server/UserIdentity;)Ljava/lang/Object;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public disassociate(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public getSystemUserIdentity()Lorg/eclipse/jetty/server/UserIdentity;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public newRunAsToken(Ljava/lang/String;)Lorg/eclipse/jetty/security/RunAsToken;
    .locals 0

    .line 1
    new-instance p0, Lorg/eclipse/jetty/security/RoleRunAsToken;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/security/RoleRunAsToken;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public newUserIdentity(Ljavax/security/auth/Subject;Ljava/security/Principal;[Ljava/lang/String;)Lorg/eclipse/jetty/server/UserIdentity;
    .locals 0

    .line 1
    new-instance p0, Lorg/eclipse/jetty/security/DefaultUserIdentity;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jetty/security/DefaultUserIdentity;-><init>(Ljavax/security/auth/Subject;Ljava/security/Principal;[Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public setRunAs(Lorg/eclipse/jetty/server/UserIdentity;Lorg/eclipse/jetty/security/RunAsToken;)Ljava/lang/Object;
    .locals 0

    return-object p2
.end method

.method public unsetRunAs(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method
