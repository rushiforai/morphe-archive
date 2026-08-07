.class public Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;
.super Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;
.source "SourceFile"


# static fields
.field private static final PASSWORD_PROPERTY:Ljava/lang/String; = "org.eclipse.jetty.ssl.password"


# instance fields
.field private _crlPath:Ljava/lang/String;

.field private _enableCRLDP:Z

.field private _enableOCSP:Z

.field private _maxCertPathLength:I

.field private _ocspResponderURL:Ljava/lang/String;

.field private transient _trustStorePassword:Lorg/eclipse/jetty/util/security/Password;

.field private _trustStorePath:Ljava/lang/String;

.field private _trustStoreProvider:Ljava/lang/String;

.field private _trustStoreType:Ljava/lang/String;

.field private _validateCerts:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "JKS"

    .line 5
    .line 6
    iput-object v0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_trustStoreType:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_maxCertPathLength:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_enableCRLDP:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_enableOCSP:Z

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getAuthMethod()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "CLIENT_CERT"

    .line 2
    .line 3
    return-object p0
.end method

.method public getCrlPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_crlPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getKeyStore(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyStore;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lorg/eclipse/jetty/util/security/CertificateUtils;->getKeyStore(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyStore;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getMaxCertPathLength()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_maxCertPathLength:I

    .line 2
    .line 3
    return p0
.end method

.method public getOcspResponderURL()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_ocspResponderURL:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrustStore()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_trustStorePath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrustStoreProvider()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_trustStoreProvider:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrustStoreType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_trustStoreType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isEnableCRLDP()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_enableCRLDP:Z

    .line 2
    .line 3
    return p0
.end method

.method public isEnableOCSP()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_enableOCSP:Z

    .line 2
    .line 3
    return p0
.end method

.method public isValidateCerts()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_validateCerts:Z

    .line 2
    .line 3
    return p0
.end method

.method public loadCRL(Ljava/lang/String;)Ljava/util/Collection;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection<",
            "+",
            "Ljava/security/cert/CRL;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lorg/eclipse/jetty/util/security/CertificateUtils;->loadCRL(Ljava/lang/String;)Ljava/util/Collection;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
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

.method public setCrlPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_crlPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setEnableCRLDP(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_enableCRLDP:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEnableOCSP(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_enableOCSP:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMaxCertPathLength(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_maxCertPathLength:I

    .line 2
    .line 3
    return-void
.end method

.method public setOcspResponderURL(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_ocspResponderURL:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTrustStore(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_trustStorePath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTrustStorePassword(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "org.eclipse.jetty.ssl.password"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, p1, v1}, Lorg/eclipse/jetty/util/security/Password;->getPassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jetty/util/security/Password;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_trustStorePassword:Lorg/eclipse/jetty/util/security/Password;

    .line 9
    .line 10
    return-void
.end method

.method public setTrustStoreProvider(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_trustStoreProvider:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTrustStoreType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_trustStoreType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setValidateCerts(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_validateCerts:Z

    .line 2
    .line 3
    return-void
.end method

.method public validateRequest(Ll/gse0;Ll/lse0;Z)Lorg/eclipse/jetty/server/Authentication;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jetty/security/ServerAuthException;
        }
    .end annotation

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    new-instance p1, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;-><init>(Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;)V

    .line 6
    .line 7
    .line 8
    return-object p1

    .line 9
    :cond_0
    move-object p3, p1

    .line 10
    check-cast p3, Ljavax/servlet/http/HttpServletRequest;

    .line 11
    .line 12
    check-cast p2, Ljavax/servlet/http/HttpServletResponse;

    .line 13
    .line 14
    const-string v0, "javax.servlet.request.X509Certificate"

    .line 15
    .line 16
    invoke-interface {p3, v0}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    check-cast p3, [Ljava/security/cert/X509Certificate;

    .line 21
    .line 22
    if-eqz p3, :cond_7

    .line 23
    .line 24
    :try_start_0
    array-length v0, p3

    .line 25
    if-lez v0, :cond_7

    .line 26
    .line 27
    iget-boolean v0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_validateCerts:Z

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v3, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_trustStorePath:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v4, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_trustStoreType:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v5, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_trustStoreProvider:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v0, p0, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_trustStorePassword:Lorg/eclipse/jetty/util/security/Password;

    .line 38
    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    :goto_0
    move-object v6, v0

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/security/Password;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    const/4 v2, 0x0

    .line 50
    move-object v1, p0

    .line 51
    invoke-virtual/range {v1 .. v6}, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->getKeyStore(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyStore;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget-object v0, v1, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->_crlPath:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->loadCRL(Ljava/lang/String;)Ljava/util/Collection;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v2, Lorg/eclipse/jetty/util/security/CertificateValidator;

    .line 62
    .line 63
    invoke-direct {v2, p0, v0}, Lorg/eclipse/jetty/util/security/CertificateValidator;-><init>(Ljava/security/KeyStore;Ljava/util/Collection;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2, p3}, Lorg/eclipse/jetty/util/security/CertificateValidator;->validate([Ljava/security/cert/Certificate;)V

    .line 67
    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_2
    move-object v1, p0

    .line 71
    :goto_2
    array-length p0, p3

    .line 72
    const/4 v0, 0x0

    .line 73
    :goto_3
    if-ge v0, p0, :cond_7

    .line 74
    .line 75
    aget-object v2, p3, v0

    .line 76
    .line 77
    if-nez v2, :cond_3

    .line 78
    .line 79
    goto :goto_5

    .line 80
    :cond_3
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    if-nez v3, :cond_4

    .line 85
    .line 86
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getIssuerDN()Ljava/security/Principal;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    :cond_4
    if-nez v3, :cond_5

    .line 91
    .line 92
    const-string v3, "clientcert"

    .line 93
    .line 94
    goto :goto_4

    .line 95
    :cond_5
    invoke-interface {v3}, Ljava/security/Principal;->getName()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    :goto_4
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getSignature()[B

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-static {v2}, Lorg/eclipse/jetty/util/B64Code;->encode([B)[C

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v1, v3, v2, p1}, Lorg/eclipse/jetty/security/authentication/LoginAuthenticator;->login(Ljava/lang/String;Ljava/lang/Object;Ll/gse0;)Lorg/eclipse/jetty/server/UserIdentity;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    if-eqz v2, :cond_6

    .line 112
    .line 113
    new-instance p0, Lorg/eclipse/jetty/security/UserAuthentication;

    .line 114
    .line 115
    invoke-virtual {v1}, Lorg/eclipse/jetty/security/authentication/ClientCertAuthenticator;->getAuthMethod()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-direct {p0, p1, v2}, Lorg/eclipse/jetty/security/UserAuthentication;-><init>(Ljava/lang/String;Lorg/eclipse/jetty/server/UserIdentity;)V

    .line 120
    .line 121
    .line 122
    return-object p0

    .line 123
    :cond_6
    :goto_5
    add-int/lit8 v0, v0, 0x1

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_7
    invoke-static {p2}, Lorg/eclipse/jetty/security/authentication/DeferredAuthentication;->isDeferred(Ljavax/servlet/http/HttpServletResponse;)Z

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    if-nez p0, :cond_8

    .line 131
    .line 132
    const/16 p0, 0x193

    .line 133
    .line 134
    invoke-interface {p2, p0}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    .line 135
    .line 136
    .line 137
    sget-object p0, Lorg/eclipse/jetty/server/Authentication;->SEND_FAILURE:Lorg/eclipse/jetty/server/Authentication;

    .line 138
    .line 139
    return-object p0

    .line 140
    :cond_8
    sget-object p0, Lorg/eclipse/jetty/server/Authentication;->UNAUTHENTICATED:Lorg/eclipse/jetty/server/Authentication;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    .line 142
    return-object p0

    .line 143
    :catch_0
    move-exception v0

    .line 144
    move-object p0, v0

    .line 145
    new-instance p1, Lorg/eclipse/jetty/security/ServerAuthException;

    .line 146
    .line 147
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-direct {p1, p0}, Lorg/eclipse/jetty/security/ServerAuthException;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    throw p1
.end method
