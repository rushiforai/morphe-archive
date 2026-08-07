.class public Lorg/eclipse/jetty/security/DefaultAuthenticatorFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/security/Authenticator$Factory;


# instance fields
.field _loginService:Lorg/eclipse/jetty/security/LoginService;


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
.method public getAuthenticator(Lorg/eclipse/jetty/server/Server;Ll/ase0;Lorg/eclipse/jetty/security/Authenticator$AuthConfiguration;Lorg/eclipse/jetty/security/IdentityService;Lorg/eclipse/jetty/security/LoginService;)Lorg/eclipse/jetty/security/Authenticator;
    .locals 0

    .line 1
    invoke-interface {p3}, Lorg/eclipse/jetty/security/Authenticator$AuthConfiguration;->getAuthMethod()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_5

    .line 6
    .line 7
    const-string p1, "BASIC"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p1, "DIGEST"

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    new-instance p1, Lorg/eclipse/jetty/security/authentication/DigestAuthenticator;

    .line 25
    .line 26
    invoke-direct {p1}, Lorg/eclipse/jetty/security/authentication/DigestAuthenticator;-><init>()V

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const-string p1, "FORM"

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_2

    .line 37
    .line 38
    new-instance p1, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;

    .line 39
    .line 40
    invoke-direct {p1}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;-><init>()V

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    const-string p1, "SPNEGO"

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_3

    .line 51
    .line 52
    new-instance p1, Lorg/eclipse/jetty/security/authentication/SpnegoAuthenticator;

    .line 53
    .line 54
    invoke-direct {p1}, Lorg/eclipse/jetty/security/authentication/SpnegoAuthenticator;-><init>()V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    const-string p1, "NEGOTIATE"

    .line 59
    .line 60
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-eqz p2, :cond_4

    .line 65
    .line 66
    new-instance p2, Lorg/eclipse/jetty/security/authentication/SpnegoAuthenticator;

    .line 67
    .line 68
    invoke-direct {p2, p1}, Lorg/eclipse/jetty/security/authentication/SpnegoAuthenticator;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    move-object p1, p2

    .line 72
    goto :goto_1

    .line 73
    :cond_4
    const/4 p1, 0x0

    .line 74
    goto :goto_1

    .line 75
    :cond_5
    :goto_0
    new-instance p1, Lorg/eclipse/jetty/security/authentication/BasicAuthenticator;

    .line 76
    .line 77
    invoke-direct {p1}, Lorg/eclipse/jetty/security/authentication/BasicAuthenticator;-><init>()V

    .line 78
    .line 79
    .line 80
    :goto_1
    const-string p2, "CLIENT_CERT"

    .line 81
    .line 82
    invoke-virtual {p2, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    if-nez p2, :cond_7

    .line 87
    .line 88
    const-string p2, "CLIENT-CERT"

    .line 89
    .line 90
    invoke-virtual {p2, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-eqz p0, :cond_6

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_6
    return-object p1

    .line 98
    :cond_7
    :goto_2
    new-instance p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;

    .line 99
    .line 100
    invoke-direct {p0}, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;-><init>()V

    .line 101
    .line 102
    .line 103
    return-object p0
.end method

.method public getLoginService()Lorg/eclipse/jetty/security/LoginService;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/DefaultAuthenticatorFactory;->_loginService:Lorg/eclipse/jetty/security/LoginService;

    .line 2
    .line 3
    return-object p0
.end method

.method public setLoginService(Lorg/eclipse/jetty/security/LoginService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/DefaultAuthenticatorFactory;->_loginService:Lorg/eclipse/jetty/security/LoginService;

    .line 2
    .line 3
    return-void
.end method
