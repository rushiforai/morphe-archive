.class public Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/server/Authentication$Deferred;


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field static final __deferredResponse:Ljavax/servlet/http/HttpServletResponse;

.field private static __nullOut:Ll/ese0;


# instance fields
.field protected final _authenticator:Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;

.field private _previousAssociation:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    new-instance v0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication$1;

    .line 10
    .line 11
    invoke-direct {v0}, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication$1;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->__deferredResponse:Ljavax/servlet/http/HttpServletResponse;

    .line 15
    .line 16
    new-instance v0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication$2;

    .line 17
    .line 18
    invoke-direct {v0}, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication$2;-><init>()V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->__nullOut:Ll/ese0;

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->_authenticator:Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "No Authenticator"

    .line 10
    .line 11
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    throw p0
.end method

.method public static synthetic access$000()Ll/ese0;
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->__nullOut:Ll/ese0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static isDeferred(Ljavax/servlet/http/HttpServletResponse;)Z
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->__deferredResponse:Ljavax/servlet/http/HttpServletResponse;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method


# virtual methods
.method public authenticate(Ll/gse0;)Lorg/eclipse/jetty/server/Authentication;
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->_authenticator:Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;

    .line 2
    .line 3
    sget-object v1, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->__deferredResponse:Ljavax/servlet/http/HttpServletResponse;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-interface {v0, p1, v1, v2}, Lorg/eclipse/jetty/security/Authenticator;->validateRequest(Ll/gse0;Ll/lse0;Z)Lorg/eclipse/jetty/server/Authentication;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    instance-of v0, p1, Lorg/eclipse/jetty/server/Authentication$User;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    instance-of v0, p1, Lorg/eclipse/jetty/server/Authentication$ResponseSent;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->_authenticator:Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;

    .line 21
    .line 22
    invoke-virtual {v0}, Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;->getLoginService()Lorg/eclipse/jetty/security/LoginService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Lorg/eclipse/jetty/security/LoginService;->getIdentityService()Lorg/eclipse/jetty/security/IdentityService;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    move-object v1, p1

    .line 33
    check-cast v1, Lorg/eclipse/jetty/server/Authentication$User;

    .line 34
    .line 35
    invoke-interface {v1}, Lorg/eclipse/jetty/server/Authentication$User;->getUserIdentity()Lorg/eclipse/jetty/server/UserIdentity;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v0, v1}, Lorg/eclipse/jetty/security/IdentityService;->associate(Lorg/eclipse/jetty/server/UserIdentity;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->_previousAssociation:Ljava/lang/Object;
    :try_end_0
    .catch Lorg/eclipse/jetty/security/ServerAuthException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    return-object p1

    .line 46
    :catch_0
    move-exception p1

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    return-object p1

    .line 49
    :cond_1
    return-object p0

    .line 50
    :goto_0
    sget-object v0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 51
    .line 52
    invoke-interface {v0, p1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    return-object p0
.end method

.method public authenticate(Ll/gse0;Ll/lse0;)Lorg/eclipse/jetty/server/Authentication;
    .locals 3

    .line 56
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->_authenticator:Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;

    invoke-virtual {v0}, Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;->getLoginService()Lorg/eclipse/jetty/security/LoginService;

    move-result-object v0

    .line 57
    invoke-interface {v0}, Lorg/eclipse/jetty/security/LoginService;->getIdentityService()Lorg/eclipse/jetty/security/IdentityService;

    move-result-object v0

    .line 58
    iget-object v1, p0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->_authenticator:Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;

    const/4 v2, 0x1

    invoke-interface {v1, p1, p2, v2}, Lorg/eclipse/jetty/security/Authenticator;->validateRequest(Ll/gse0;Ll/lse0;Z)Lorg/eclipse/jetty/server/Authentication;

    move-result-object p1

    .line 59
    instance-of p2, p1, Lorg/eclipse/jetty/server/Authentication$User;

    if-eqz p2, :cond_0

    if-eqz v0, :cond_0

    .line 60
    move-object p2, p1

    check-cast p2, Lorg/eclipse/jetty/server/Authentication$User;

    invoke-interface {p2}, Lorg/eclipse/jetty/server/Authentication$User;->getUserIdentity()Lorg/eclipse/jetty/server/UserIdentity;

    move-result-object p2

    invoke-interface {v0, p2}, Lorg/eclipse/jetty/security/IdentityService;->associate(Lorg/eclipse/jetty/server/UserIdentity;)Ljava/lang/Object;

    move-result-object p2

    iput-object p2, p0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->_previousAssociation:Ljava/lang/Object;
    :try_end_0
    .catch Lorg/eclipse/jetty/security/ServerAuthException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    goto :goto_0

    :cond_0
    return-object p1

    .line 61
    :goto_0
    sget-object p2, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    invoke-interface {p2, p1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    return-object p0
.end method

.method public getPreviousAssociation()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->_previousAssociation:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public login(Ljava/lang/String;Ljava/lang/Object;Ll/gse0;)Lorg/eclipse/jetty/server/Authentication;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->_authenticator:Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;->login(Ljava/lang/String;Ljava/lang/Object;Ll/gse0;)Lorg/eclipse/jetty/server/UserIdentity;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p2, p0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->_authenticator:Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;

    .line 10
    .line 11
    invoke-virtual {p2}, Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;->getLoginService()Lorg/eclipse/jetty/security/LoginService;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-interface {p2}, Lorg/eclipse/jetty/security/LoginService;->getIdentityService()Lorg/eclipse/jetty/security/IdentityService;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    new-instance p3, Lorg/eclipse/jetty/security/UserAuthentication;

    .line 20
    .line 21
    const-string v0, "API"

    .line 22
    .line 23
    invoke-direct {p3, v0, p1}, Lorg/eclipse/jetty/security/UserAuthentication;-><init>(Ljava/lang/String;Lorg/eclipse/jetty/server/UserIdentity;)V

    .line 24
    .line 25
    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    invoke-interface {p2, p1}, Lorg/eclipse/jetty/security/IdentityService;->associate(Lorg/eclipse/jetty/server/UserIdentity;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->_previousAssociation:Ljava/lang/Object;

    .line 33
    .line 34
    :cond_0
    return-object p3

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return-object p0
.end method
