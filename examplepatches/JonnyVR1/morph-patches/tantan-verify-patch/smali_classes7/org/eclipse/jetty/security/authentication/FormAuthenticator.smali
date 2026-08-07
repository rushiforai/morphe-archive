.class public Lorg/eclipse/jetty/security/authentication/FormAuthenticator;
.super Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/security/authentication/FormAuthenticator$FormAuthentication;,
        Lorg/eclipse/jetty/security/authentication/FormAuthenticator$FormResponse;,
        Lorg/eclipse/jetty/security/authentication/FormAuthenticator$FormRequest;
    }
.end annotation


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field public static final __FORM_DISPATCH:Ljava/lang/String; = "org.eclipse.jetty.security.dispatch"

.field public static final __FORM_ERROR_PAGE:Ljava/lang/String; = "org.eclipse.jetty.security.form_error_page"

.field public static final __FORM_LOGIN_PAGE:Ljava/lang/String; = "org.eclipse.jetty.security.form_login_page"

.field public static final __J_PASSWORD:Ljava/lang/String; = "j_password"

.field public static final __J_POST:Ljava/lang/String; = "org.eclipse.jetty.security.form_POST"

.field public static final __J_SECURITY_CHECK:Ljava/lang/String; = "/j_security_check"

.field public static final __J_URI:Ljava/lang/String; = "org.eclipse.jetty.security.form_URI"

.field public static final __J_USERNAME:Ljava/lang/String; = "j_username"


# instance fields
.field private _alwaysSaveUri:Z

.field private _dispatch:Z

.field private _formErrorPage:Ljava/lang/String;

.field private _formErrorPath:Ljava/lang/String;

.field private _formLoginPage:Ljava/lang/String;

.field private _formLoginPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->setLoginPage(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    if-eqz p2, :cond_1

    .line 10
    .line 11
    invoke-direct {p0, p2}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->setErrorPage(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_1
    iput-boolean p3, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_dispatch:Z

    .line 15
    .line 16
    return-void
.end method

.method private setErrorPage(Ljava/lang/String;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "/"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, 0x0

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    sget-object v1, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 24
    .line 25
    const-string v3, "form-error-page must start with /"

    .line 26
    .line 27
    new-array v4, v2, [Ljava/lang/Object;

    .line 28
    .line 29
    invoke-interface {v1, v3, v4}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    :cond_1
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formErrorPage:Ljava/lang/String;

    .line 37
    .line 38
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formErrorPath:Ljava/lang/String;

    .line 39
    .line 40
    const/16 v0, 0x3f

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-lez p1, :cond_2

    .line 47
    .line 48
    iget-object p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formErrorPath:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formErrorPath:Ljava/lang/String;

    .line 59
    .line 60
    :cond_2
    return-void

    .line 61
    :cond_3
    :goto_0
    const/4 p1, 0x0

    .line 62
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formErrorPath:Ljava/lang/String;

    .line 63
    .line 64
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formErrorPage:Ljava/lang/String;

    .line 65
    .line 66
    return-void
.end method

.method private setLoginPage(Ljava/lang/String;)V
    .locals 5

    .line 1
    const-string v0, "/"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    sget-object v1, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 11
    .line 12
    const-string v3, "form-login-page must start with /"

    .line 13
    .line 14
    new-array v4, v2, [Ljava/lang/Object;

    .line 15
    .line 16
    invoke-interface {v1, v3, v4}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formLoginPage:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formLoginPath:Ljava/lang/String;

    .line 26
    .line 27
    const/16 v0, 0x3f

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-lez p1, :cond_1

    .line 34
    .line 35
    iget-object p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formLoginPath:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formLoginPath:Ljava/lang/String;

    .line 46
    .line 47
    :cond_1
    return-void
.end method


# virtual methods
.method public getAlwaysSaveUri()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_alwaysSaveUri:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAuthMethod()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "FORM"

    .line 2
    .line 3
    return-object p0
.end method

.method public isJSecurityCheck(Ljava/lang/String;)Z
    .locals 3

    .line 1
    const-string p0, "/j_security_check"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-gez p0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    add-int/lit8 p0, p0, 0x11

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x1

    .line 18
    if-ne p0, v1, :cond_1

    .line 19
    .line 20
    return v2

    .line 21
    :cond_1
    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/16 p1, 0x3b

    .line 26
    .line 27
    if-eq p0, p1, :cond_3

    .line 28
    .line 29
    const/16 p1, 0x23

    .line 30
    .line 31
    if-eq p0, p1, :cond_3

    .line 32
    .line 33
    const/16 p1, 0x2f

    .line 34
    .line 35
    if-eq p0, p1, :cond_3

    .line 36
    .line 37
    const/16 p1, 0x3f

    .line 38
    .line 39
    if-ne p0, p1, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    return v0

    .line 43
    :cond_3
    :goto_0
    return v2
.end method

.method public isLoginOrErrorPage(Ljava/lang/String;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formErrorPath:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formLoginPath:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public login(Ljava/lang/String;Ljava/lang/Object;Ll/gse0;)Lorg/eclipse/jetty/server/UserIdentity;
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;->login(Ljava/lang/String;Ljava/lang/Object;Ll/gse0;)Lorg/eclipse/jetty/server/UserIdentity;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p3, Ljavax/servlet/http/HttpServletRequest;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-interface {p3, v0}, Ljavax/servlet/http/HttpServletRequest;->getSession(Z)Ll/hnl;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    new-instance v0, Lorg/eclipse/jetty/security/authentication/SessionAuthentication;

    .line 15
    .line 16
    invoke-virtual {p0}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->getAuthMethod()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-direct {v0, p0, p1, p2}, Lorg/eclipse/jetty/security/authentication/SessionAuthentication;-><init>(Ljava/lang/String;Lorg/eclipse/jetty/server/UserIdentity;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    const-string p0, "org.eclipse.jetty.security.UserIdentity"

    .line 24
    .line 25
    invoke-interface {p3, p0, v0}, Ll/hnl;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-object p1
.end method

.method public secureResponse(Ll/gse0;Ll/lse0;ZLorg/eclipse/jetty/server/Authentication$User;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jetty/security/ServerAuthException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public setAlwaysSaveUri(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_alwaysSaveUri:Z

    .line 2
    .line 3
    return-void
.end method

.method public setConfiguration(Lorg/eclipse/jetty/security/Authenticator$AuthConfiguration;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;->setConfiguration(Lorg/eclipse/jetty/security/Authenticator$AuthConfiguration;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "org.eclipse.jetty.security.form_login_page"

    .line 5
    .line 6
    invoke-interface {p1, v0}, Lorg/eclipse/jetty/security/Authenticator$AuthConfiguration;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->setLoginPage(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    const-string v0, "org.eclipse.jetty.security.form_error_page"

    .line 16
    .line 17
    invoke-interface {p1, v0}, Lorg/eclipse/jetty/security/Authenticator$AuthConfiguration;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->setErrorPage(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    const-string v0, "org.eclipse.jetty.security.dispatch"

    .line 27
    .line 28
    invoke-interface {p1, v0}, Lorg/eclipse/jetty/security/Authenticator$AuthConfiguration;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-nez p1, :cond_2

    .line 33
    .line 34
    iget-boolean p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_dispatch:Z

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    :goto_0
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_dispatch:Z

    .line 46
    .line 47
    return-void
.end method

.method public validateRequest(Ll/gse0;Ll/lse0;Z)Lorg/eclipse/jetty/server/Authentication;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jetty/security/ServerAuthException;
        }
    .end annotation

    .line 1
    const-string v0, "Form authentication FAILED for "

    .line 2
    .line 3
    move-object v1, p1

    .line 4
    check-cast v1, Ljavax/servlet/http/HttpServletRequest;

    .line 5
    .line 6
    check-cast p2, Ljavax/servlet/http/HttpServletResponse;

    .line 7
    .line 8
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getRequestURI()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    const-string v2, "/"

    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0, v2}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->isJSecurityCheck(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    or-int/2addr p3, v3

    .line 21
    if-nez p3, :cond_1

    .line 22
    .line 23
    new-instance p1, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;-><init>(Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;)V

    .line 26
    .line 27
    .line 28
    return-object p1

    .line 29
    :cond_1
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getServletPath()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-static {p3, v3}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-virtual {p0, p3}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->isLoginOrErrorPage(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    if-eqz p3, :cond_2

    .line 46
    .line 47
    invoke-static {p2}, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->isDeferred(Ljavax/servlet/http/HttpServletResponse;)Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-nez p3, :cond_2

    .line 52
    .line 53
    new-instance p1, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;

    .line 54
    .line 55
    invoke-direct {p1, p0}, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;-><init>(Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;)V

    .line 56
    .line 57
    .line 58
    return-object p1

    .line 59
    :cond_2
    const/4 p3, 0x1

    .line 60
    invoke-interface {v1, p3}, Ljavax/servlet/http/HttpServletRequest;->getSession(Z)Ll/hnl;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    :try_start_0
    invoke-virtual {p0, v2}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->isJSecurityCheck(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    const-wide/16 v4, 0x1

    .line 69
    .line 70
    if-eqz v2, :cond_a

    .line 71
    .line 72
    const-string p1, "j_username"

    .line 73
    .line 74
    invoke-interface {v1, p1}, Ll/gse0;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const-string v2, "j_password"

    .line 79
    .line 80
    invoke-interface {v1, v2}, Ll/gse0;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {p0, p1, v2, v1}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->login(Ljava/lang/String;Ljava/lang/Object;Ll/gse0;)Lorg/eclipse/jetty/server/UserIdentity;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-interface {v1, p3}, Ljavax/servlet/http/HttpServletRequest;->getSession(Z)Ll/hnl;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    const/4 v3, 0x0

    .line 93
    if-eqz v2, :cond_5

    .line 94
    .line 95
    monitor-enter p3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/servlet/ServletException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    :try_start_1
    const-string p1, "org.eclipse.jetty.security.form_URI"

    .line 97
    .line 98
    invoke-interface {p3, p1}, Ll/hnl;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    check-cast p1, Ljava/lang/String;

    .line 103
    .line 104
    if-eqz p1, :cond_3

    .line 105
    .line 106
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_4

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :catchall_0
    move-exception p0

    .line 114
    goto :goto_1

    .line 115
    :cond_3
    :goto_0
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getContextPath()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_4

    .line 124
    .line 125
    const-string p1, "/"

    .line 126
    .line 127
    :cond_4
    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 128
    :try_start_2
    invoke-interface {p2, v3}, Ll/lse0;->setContentLength(I)V

    .line 129
    .line 130
    .line 131
    invoke-interface {p2, p1}, Ljavax/servlet/http/HttpServletResponse;->encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-interface {p2, p1}, Ljavax/servlet/http/HttpServletResponse;->sendRedirect(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    new-instance p1, Lorg/eclipse/jetty/security/authentication/FormAuthenticator$FormAuthentication;

    .line 139
    .line 140
    invoke-virtual {p0}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->getAuthMethod()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-direct {p1, p0, v2}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator$FormAuthentication;-><init>(Ljava/lang/String;Lorg/eclipse/jetty/server/UserIdentity;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljavax/servlet/ServletException; {:try_start_2 .. :try_end_2} :catch_0

    .line 145
    .line 146
    .line 147
    return-object p1

    .line 148
    :goto_1
    :try_start_3
    monitor-exit p3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 149
    :try_start_4
    throw p0

    .line 150
    :cond_5
    sget-object p3, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 151
    .line 152
    invoke-interface {p3}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    if-eqz v2, :cond_6

    .line 157
    .line 158
    new-instance v2, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    invoke-static {p1}, Lorg/eclipse/jetty/util/StringUtil;->printable(Ljava/lang/String;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    new-array v0, v3, [Ljava/lang/Object;

    .line 175
    .line 176
    invoke-interface {p3, p1, v0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    :cond_6
    iget-object p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formErrorPage:Ljava/lang/String;

    .line 180
    .line 181
    if-nez p1, :cond_7

    .line 182
    .line 183
    if-eqz p2, :cond_9

    .line 184
    .line 185
    const/16 p0, 0x193

    .line 186
    .line 187
    invoke-interface {p2, p0}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    .line 188
    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_7
    iget-boolean p3, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_dispatch:Z

    .line 192
    .line 193
    if-eqz p3, :cond_8

    .line 194
    .line 195
    invoke-interface {v1, p1}, Ll/gse0;->getRequestDispatcher(Ljava/lang/String;)Ll/c2d0;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    const-string p1, "Cache-Control"

    .line 200
    .line 201
    const-string p3, "No-cache"

    .line 202
    .line 203
    invoke-interface {p2, p1, p3}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    const-string p1, "Expires"

    .line 207
    .line 208
    invoke-interface {p2, p1, v4, v5}, Ljavax/servlet/http/HttpServletResponse;->setDateHeader(Ljava/lang/String;J)V

    .line 209
    .line 210
    .line 211
    new-instance p1, Lorg/eclipse/jetty/security/authentication/FormAuthenticator$FormRequest;

    .line 212
    .line 213
    invoke-direct {p1, v1}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator$FormRequest;-><init>(Ljavax/servlet/http/HttpServletRequest;)V

    .line 214
    .line 215
    .line 216
    new-instance p3, Lorg/eclipse/jetty/security/authentication/FormAuthenticator$FormResponse;

    .line 217
    .line 218
    invoke-direct {p3, p2}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator$FormResponse;-><init>(Ljavax/servlet/http/HttpServletResponse;)V

    .line 219
    .line 220
    .line 221
    invoke-interface {p0, p1, p3}, Ll/c2d0;->forward(Ll/gse0;Ll/lse0;)V

    .line 222
    .line 223
    .line 224
    goto :goto_2

    .line 225
    :cond_8
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getContextPath()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formErrorPage:Ljava/lang/String;

    .line 230
    .line 231
    invoke-static {p1, p0}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    invoke-interface {p2, p0}, Ljavax/servlet/http/HttpServletResponse;->encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-interface {p2, p0}, Ljavax/servlet/http/HttpServletResponse;->sendRedirect(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    :cond_9
    :goto_2
    sget-object p0, Lorg/eclipse/jetty/server/Authentication;->SEND_FAILURE:Lorg/eclipse/jetty/server/Authentication;

    .line 243
    .line 244
    return-object p0

    .line 245
    :cond_a
    const-string p3, "org.eclipse.jetty.security.UserIdentity"

    .line 246
    .line 247
    invoke-interface {v3, p3}, Ll/hnl;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object p3

    .line 251
    check-cast p3, Lorg/eclipse/jetty/server/Authentication;

    .line 252
    .line 253
    if-eqz p3, :cond_10

    .line 254
    .line 255
    instance-of v0, p3, Lorg/eclipse/jetty/server/Authentication$User;

    .line 256
    .line 257
    if-eqz v0, :cond_b

    .line 258
    .line 259
    iget-object v0, p0, Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;->_loginService:Lorg/eclipse/jetty/security/LoginService;

    .line 260
    .line 261
    if-eqz v0, :cond_b

    .line 262
    .line 263
    move-object v2, p3

    .line 264
    check-cast v2, Lorg/eclipse/jetty/server/Authentication$User;

    .line 265
    .line 266
    invoke-interface {v2}, Lorg/eclipse/jetty/server/Authentication$User;->getUserIdentity()Lorg/eclipse/jetty/server/UserIdentity;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/security/LoginService;->validate(Lorg/eclipse/jetty/server/UserIdentity;)Z

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    if-nez v0, :cond_b

    .line 275
    .line 276
    const-string p3, "org.eclipse.jetty.security.UserIdentity"

    .line 277
    .line 278
    invoke-interface {v3, p3}, Ll/hnl;->removeAttribute(Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    goto :goto_4

    .line 282
    :cond_b
    const-string p0, "org.eclipse.jetty.security.form_URI"

    .line 283
    .line 284
    invoke-interface {v3, p0}, Ll/hnl;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object p0

    .line 288
    check-cast p0, Ljava/lang/String;

    .line 289
    .line 290
    if-eqz p0, :cond_f

    .line 291
    .line 292
    const-string p2, "org.eclipse.jetty.security.form_POST"

    .line 293
    .line 294
    invoke-interface {v3, p2}, Ll/hnl;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    move-result-object p2

    .line 298
    check-cast p2, Lorg/eclipse/jetty/util/MultiMap;

    .line 299
    .line 300
    if-eqz p2, :cond_e

    .line 301
    .line 302
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getRequestURL()Ljava/lang/StringBuffer;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getQueryString()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v2

    .line 310
    if-eqz v2, :cond_c

    .line 311
    .line 312
    const-string v2, "?"

    .line 313
    .line 314
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 315
    .line 316
    .line 317
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getQueryString()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 322
    .line 323
    .line 324
    :cond_c
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result p0

    .line 332
    if-eqz p0, :cond_f

    .line 333
    .line 334
    const-string p0, "org.eclipse.jetty.security.form_POST"

    .line 335
    .line 336
    invoke-interface {v3, p0}, Ll/hnl;->removeAttribute(Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    instance-of p0, p1, Lorg/eclipse/jetty/server/Request;

    .line 340
    .line 341
    if-eqz p0, :cond_d

    .line 342
    .line 343
    check-cast p1, Lorg/eclipse/jetty/server/Request;

    .line 344
    .line 345
    goto :goto_3

    .line 346
    :cond_d
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getCurrentConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 347
    .line 348
    .line 349
    move-result-object p0

    .line 350
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    .line 351
    .line 352
    .line 353
    move-result-object p1

    .line 354
    :goto_3
    const-string p0, "POST"

    .line 355
    .line 356
    invoke-virtual {p1, p0}, Lorg/eclipse/jetty/server/Request;->setMethod(Ljava/lang/String;)V

    .line 357
    .line 358
    .line 359
    invoke-virtual {p1, p2}, Lorg/eclipse/jetty/server/Request;->setParameters(Lorg/eclipse/jetty/util/MultiMap;)V

    .line 360
    .line 361
    .line 362
    return-object p3

    .line 363
    :cond_e
    const-string p0, "org.eclipse.jetty.security.form_URI"

    .line 364
    .line 365
    invoke-interface {v3, p0}, Ll/hnl;->removeAttribute(Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    :cond_f
    return-object p3

    .line 369
    :cond_10
    :goto_4
    invoke-static {p2}, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->isDeferred(Ljavax/servlet/http/HttpServletResponse;)Z

    .line 370
    .line 371
    .line 372
    move-result p3

    .line 373
    if-eqz p3, :cond_11

    .line 374
    .line 375
    sget-object p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 376
    .line 377
    const-string p1, "auth deferred {}"

    .line 378
    .line 379
    invoke-interface {v3}, Ll/hnl;->getId()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object p2

    .line 383
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object p2

    .line 387
    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 388
    .line 389
    .line 390
    sget-object p0, Lorg/eclipse/jetty/server/Authentication;->UNAUTHENTICATED:Lorg/eclipse/jetty/server/Authentication;

    .line 391
    .line 392
    return-object p0

    .line 393
    :cond_11
    monitor-enter v3
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljavax/servlet/ServletException; {:try_start_4 .. :try_end_4} :catch_0

    .line 394
    :try_start_5
    const-string p3, "org.eclipse.jetty.security.form_URI"

    .line 395
    .line 396
    invoke-interface {v3, p3}, Ll/hnl;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 397
    .line 398
    .line 399
    move-result-object p3

    .line 400
    if-eqz p3, :cond_12

    .line 401
    .line 402
    iget-boolean p3, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_alwaysSaveUri:Z

    .line 403
    .line 404
    if-eqz p3, :cond_15

    .line 405
    .line 406
    goto :goto_5

    .line 407
    :catchall_1
    move-exception p0

    .line 408
    goto/16 :goto_8

    .line 409
    .line 410
    :cond_12
    :goto_5
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getRequestURL()Ljava/lang/StringBuffer;

    .line 411
    .line 412
    .line 413
    move-result-object p3

    .line 414
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getQueryString()Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    if-eqz v0, :cond_13

    .line 419
    .line 420
    const-string v0, "?"

    .line 421
    .line 422
    invoke-virtual {p3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 423
    .line 424
    .line 425
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getQueryString()Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    invoke-virtual {p3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 430
    .line 431
    .line 432
    :cond_13
    const-string v0, "org.eclipse.jetty.security.form_URI"

    .line 433
    .line 434
    invoke-virtual {p3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object p3

    .line 438
    invoke-interface {v3, v0, p3}, Ll/hnl;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 439
    .line 440
    .line 441
    const-string p3, "application/x-www-form-urlencoded"

    .line 442
    .line 443
    invoke-interface {p1}, Ll/gse0;->getContentType()Ljava/lang/String;

    .line 444
    .line 445
    .line 446
    move-result-object v0

    .line 447
    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 448
    .line 449
    .line 450
    move-result p3

    .line 451
    if-eqz p3, :cond_15

    .line 452
    .line 453
    const-string p3, "POST"

    .line 454
    .line 455
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getMethod()Ljava/lang/String;

    .line 456
    .line 457
    .line 458
    move-result-object v0

    .line 459
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 460
    .line 461
    .line 462
    move-result p3

    .line 463
    if-eqz p3, :cond_15

    .line 464
    .line 465
    instance-of p3, p1, Lorg/eclipse/jetty/server/Request;

    .line 466
    .line 467
    if-eqz p3, :cond_14

    .line 468
    .line 469
    check-cast p1, Lorg/eclipse/jetty/server/Request;

    .line 470
    .line 471
    goto :goto_6

    .line 472
    :cond_14
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getCurrentConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 473
    .line 474
    .line 475
    move-result-object p1

    .line 476
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    .line 477
    .line 478
    .line 479
    move-result-object p1

    .line 480
    :goto_6
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/Request;->extractParameters()V

    .line 481
    .line 482
    .line 483
    const-string p3, "org.eclipse.jetty.security.form_POST"

    .line 484
    .line 485
    new-instance v0, Lorg/eclipse/jetty/util/MultiMap;

    .line 486
    .line 487
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/Request;->getParameters()Lorg/eclipse/jetty/util/MultiMap;

    .line 488
    .line 489
    .line 490
    move-result-object p1

    .line 491
    invoke-direct {v0, p1}, Lorg/eclipse/jetty/util/MultiMap;-><init>(Lorg/eclipse/jetty/util/MultiMap;)V

    .line 492
    .line 493
    .line 494
    invoke-interface {v3, p3, v0}, Ll/hnl;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 495
    .line 496
    .line 497
    :cond_15
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 498
    :try_start_6
    iget-boolean p1, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_dispatch:Z

    .line 499
    .line 500
    if-eqz p1, :cond_16

    .line 501
    .line 502
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formLoginPage:Ljava/lang/String;

    .line 503
    .line 504
    invoke-interface {v1, p0}, Ll/gse0;->getRequestDispatcher(Ljava/lang/String;)Ll/c2d0;

    .line 505
    .line 506
    .line 507
    move-result-object p0

    .line 508
    const-string p1, "Cache-Control"

    .line 509
    .line 510
    const-string p3, "No-cache"

    .line 511
    .line 512
    invoke-interface {p2, p1, p3}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    .line 514
    .line 515
    const-string p1, "Expires"

    .line 516
    .line 517
    invoke-interface {p2, p1, v4, v5}, Ljavax/servlet/http/HttpServletResponse;->setDateHeader(Ljava/lang/String;J)V

    .line 518
    .line 519
    .line 520
    new-instance p1, Lorg/eclipse/jetty/security/authentication/FormAuthenticator$FormRequest;

    .line 521
    .line 522
    invoke-direct {p1, v1}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator$FormRequest;-><init>(Ljavax/servlet/http/HttpServletRequest;)V

    .line 523
    .line 524
    .line 525
    new-instance p3, Lorg/eclipse/jetty/security/authentication/FormAuthenticator$FormResponse;

    .line 526
    .line 527
    invoke-direct {p3, p2}, Lorg/eclipse/jetty/security/authentication/FormAuthenticator$FormResponse;-><init>(Ljavax/servlet/http/HttpServletResponse;)V

    .line 528
    .line 529
    .line 530
    invoke-interface {p0, p1, p3}, Ll/c2d0;->forward(Ll/gse0;Ll/lse0;)V

    .line 531
    .line 532
    .line 533
    goto :goto_7

    .line 534
    :cond_16
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getContextPath()Ljava/lang/String;

    .line 535
    .line 536
    .line 537
    move-result-object p1

    .line 538
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/FormAuthenticator;->_formLoginPage:Ljava/lang/String;

    .line 539
    .line 540
    invoke-static {p1, p0}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 541
    .line 542
    .line 543
    move-result-object p0

    .line 544
    invoke-interface {p2, p0}, Ljavax/servlet/http/HttpServletResponse;->encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object p0

    .line 548
    invoke-interface {p2, p0}, Ljavax/servlet/http/HttpServletResponse;->sendRedirect(Ljava/lang/String;)V

    .line 549
    .line 550
    .line 551
    :goto_7
    sget-object p0, Lorg/eclipse/jetty/server/Authentication;->SEND_CONTINUE:Lorg/eclipse/jetty/server/Authentication;
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljavax/servlet/ServletException; {:try_start_6 .. :try_end_6} :catch_0

    .line 552
    .line 553
    return-object p0

    .line 554
    :goto_8
    :try_start_7
    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 555
    :try_start_8
    throw p0
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljavax/servlet/ServletException; {:try_start_8 .. :try_end_8} :catch_0

    .line 556
    :catch_0
    move-exception p0

    .line 557
    new-instance p1, Lorg/eclipse/jetty/security/ServerAuthException;

    .line 558
    .line 559
    invoke-direct {p1, p0}, Lorg/eclipse/jetty/security/ServerAuthException;-><init>(Ljava/lang/Throwable;)V

    .line 560
    .line 561
    .line 562
    throw p1

    .line 563
    :catch_1
    move-exception p0

    .line 564
    new-instance p1, Lorg/eclipse/jetty/security/ServerAuthException;

    .line 565
    .line 566
    invoke-direct {p1, p0}, Lorg/eclipse/jetty/security/ServerAuthException;-><init>(Ljava/lang/Throwable;)V

    .line 567
    .line 568
    .line 569
    throw p1
.end method
