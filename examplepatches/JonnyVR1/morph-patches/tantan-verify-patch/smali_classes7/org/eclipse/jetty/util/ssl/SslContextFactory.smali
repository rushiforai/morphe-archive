.class public Lorg/eclipse/jetty/util/ssl/SslContextFactory;
.super Lorg/eclipse/jetty/util/component/AbstractLifeCycle;
.source "SourceFile"


# static fields
.field public static final DEFAULT_KEYMANAGERFACTORY_ALGORITHM:Ljava/lang/String;

.field public static final DEFAULT_KEYSTORE_PATH:Ljava/lang/String;

.field public static final DEFAULT_TRUSTMANAGERFACTORY_ALGORITHM:Ljava/lang/String;

.field public static final KEYPASSWORD_PROPERTY:Ljava/lang/String; = "org.eclipse.jetty.ssl.keypassword"

.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field public static final PASSWORD_PROPERTY:Ljava/lang/String; = "org.eclipse.jetty.ssl.password"

.field public static final TRUST_ALL_CERTS:[Ljavax/net/ssl/TrustManager;


# instance fields
.field private _allowRenegotiate:Z

.field private _certAlias:Ljava/lang/String;

.field private _context:Ljavax/net/ssl/SSLContext;

.field private _crlPath:Ljava/lang/String;

.field private _enableCRLDP:Z

.field private _enableOCSP:Z

.field private final _excludeCipherSuites:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final _excludeProtocols:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _includeCipherSuites:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _includeProtocols:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _keyManagerFactoryAlgorithm:Ljava/lang/String;

.field private transient _keyManagerPassword:Lorg/eclipse/jetty/util/security/Password;

.field private _keyStore:Ljava/security/KeyStore;

.field private _keyStoreInputStream:Ljava/io/InputStream;

.field private transient _keyStorePassword:Lorg/eclipse/jetty/util/security/Password;

.field private _keyStorePath:Ljava/lang/String;

.field private _keyStoreProvider:Ljava/lang/String;

.field private _keyStoreType:Ljava/lang/String;

.field private _maxCertPathLength:I

.field private _needClientAuth:Z

.field private _ocspResponderURL:Ljava/lang/String;

.field private _secureRandomAlgorithm:Ljava/lang/String;

.field private _sessionCachingEnabled:Z

.field private _sslProtocol:Ljava/lang/String;

.field private _sslProvider:Ljava/lang/String;

.field private _sslSessionCacheSize:I

.field private _sslSessionTimeout:I

.field private _trustAll:Z

.field private _trustManagerFactoryAlgorithm:Ljava/lang/String;

.field private _trustStore:Ljava/security/KeyStore;

.field private _trustStoreInputStream:Ljava/io/InputStream;

.field private transient _trustStorePassword:Lorg/eclipse/jetty/util/security/Password;

.field private _trustStorePath:Ljava/lang/String;

.field private _trustStoreProvider:Ljava/lang/String;

.field private _trustStoreType:Ljava/lang/String;

.field private _validateCerts:Z

.field private _validatePeerCerts:Z

.field private _wantClientAuth:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lorg/eclipse/jetty/util/ssl/SslContextFactory$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory$1;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    new-array v1, v1, [Ljavax/net/ssl/X509TrustManager;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aput-object v0, v1, v2

    .line 11
    .line 12
    sput-object v1, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->TRUST_ALL_CERTS:[Ljavax/net/ssl/TrustManager;

    .line 13
    .line 14
    const-class v0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 15
    .line 16
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 21
    .line 22
    const-string v0, "ssl.KeyManagerFactory.algorithm"

    .line 23
    .line 24
    invoke-static {v0}, Ljava/security/Security;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "SunX509"

    .line 29
    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    move-object v0, v2

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-static {v0}, Ljava/security/Security;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :goto_0
    sput-object v0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->DEFAULT_KEYMANAGERFACTORY_ALGORITHM:Ljava/lang/String;

    .line 39
    .line 40
    const-string v0, "ssl.TrustManagerFactory.algorithm"

    .line 41
    .line 42
    invoke-static {v0}, Ljava/security/Security;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    invoke-static {v0}, Ljava/security/Security;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    :goto_1
    sput-object v2, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->DEFAULT_TRUSTMANAGERFACTORY_ALGORITHM:Ljava/lang/String;

    .line 54
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    const-string v1, "user.home"

    .line 61
    .line 62
    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v1, ".keystore"

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sput-object v0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->DEFAULT_KEYSTORE_PATH:Ljava/lang/String;

    .line 84
    .line 85
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeProtocols:Ljava/util/Set;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_includeProtocols:Ljava/util/Set;

    .line 13
    .line 14
    new-instance v1, Ljava/util/LinkedHashSet;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeCipherSuites:Ljava/util/Set;

    .line 20
    .line 21
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_includeCipherSuites:Ljava/util/Set;

    .line 22
    .line 23
    const-string v0, "JKS"

    .line 24
    .line 25
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreType:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreType:Ljava/lang/String;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_needClientAuth:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_wantClientAuth:Z

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_allowRenegotiate:Z

    .line 36
    .line 37
    const-string v2, "TLS"

    .line 38
    .line 39
    iput-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslProtocol:Ljava/lang/String;

    .line 40
    .line 41
    sget-object v2, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->DEFAULT_KEYMANAGERFACTORY_ALGORITHM:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyManagerFactoryAlgorithm:Ljava/lang/String;

    .line 44
    .line 45
    sget-object v2, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->DEFAULT_TRUSTMANAGERFACTORY_ALGORITHM:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustManagerFactoryAlgorithm:Ljava/lang/String;

    .line 48
    .line 49
    const/4 v2, -0x1

    .line 50
    iput v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_maxCertPathLength:I

    .line 51
    .line 52
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableCRLDP:Z

    .line 53
    .line 54
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableOCSP:Z

    .line 55
    .line 56
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sessionCachingEnabled:Z

    .line 57
    .line 58
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustAll:Z

    .line 59
    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 79
    invoke-direct {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;-><init>()V

    .line 80
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeProtocols:Ljava/util/Set;

    const/4 v0, 0x0

    .line 81
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_includeProtocols:Ljava/util/Set;

    .line 82
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeCipherSuites:Ljava/util/Set;

    .line 83
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_includeCipherSuites:Ljava/util/Set;

    .line 84
    const-string v0, "JKS"

    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreType:Ljava/lang/String;

    .line 85
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreType:Ljava/lang/String;

    const/4 v0, 0x0

    .line 86
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_needClientAuth:Z

    .line 87
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_wantClientAuth:Z

    const/4 v1, 0x1

    .line 88
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_allowRenegotiate:Z

    .line 89
    const-string v2, "TLS"

    iput-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslProtocol:Ljava/lang/String;

    .line 90
    sget-object v2, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->DEFAULT_KEYMANAGERFACTORY_ALGORITHM:Ljava/lang/String;

    iput-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyManagerFactoryAlgorithm:Ljava/lang/String;

    .line 91
    sget-object v2, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->DEFAULT_TRUSTMANAGERFACTORY_ALGORITHM:Ljava/lang/String;

    iput-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustManagerFactoryAlgorithm:Ljava/lang/String;

    const/4 v2, -0x1

    .line 92
    iput v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_maxCertPathLength:I

    .line 93
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableCRLDP:Z

    .line 94
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableOCSP:Z

    .line 95
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sessionCachingEnabled:Z

    .line 96
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePath:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 3

    .line 61
    invoke-direct {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;-><init>()V

    .line 62
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeProtocols:Ljava/util/Set;

    const/4 v0, 0x0

    .line 63
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_includeProtocols:Ljava/util/Set;

    .line 64
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeCipherSuites:Ljava/util/Set;

    .line 65
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_includeCipherSuites:Ljava/util/Set;

    .line 66
    const-string v0, "JKS"

    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreType:Ljava/lang/String;

    .line 67
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreType:Ljava/lang/String;

    const/4 v0, 0x0

    .line 68
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_needClientAuth:Z

    .line 69
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_wantClientAuth:Z

    const/4 v1, 0x1

    .line 70
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_allowRenegotiate:Z

    .line 71
    const-string v2, "TLS"

    iput-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslProtocol:Ljava/lang/String;

    .line 72
    sget-object v2, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->DEFAULT_KEYMANAGERFACTORY_ALGORITHM:Ljava/lang/String;

    iput-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyManagerFactoryAlgorithm:Ljava/lang/String;

    .line 73
    sget-object v2, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->DEFAULT_TRUSTMANAGERFACTORY_ALGORITHM:Ljava/lang/String;

    iput-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustManagerFactoryAlgorithm:Ljava/lang/String;

    const/4 v2, -0x1

    .line 74
    iput v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_maxCertPathLength:I

    .line 75
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableCRLDP:Z

    .line 76
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableOCSP:Z

    .line 77
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sessionCachingEnabled:Z

    .line 78
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustAll:Z

    return-void
.end method


# virtual methods
.method public varargs addExcludeCipherSuites([Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeCipherSuites:Ljava/util/Set;

    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public varargs addExcludeProtocols([Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeProtocols:Ljava/util/Set;

    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public checkKeyStore()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_context:Ljavax/net/ssl/SSLContext;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStore:Ljava/security/KeyStore;

    .line 7
    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreInputStream:Ljava/io/InputStream;

    .line 11
    .line 12
    if-nez v1, :cond_2

    .line 13
    .line 14
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePath:Ljava/lang/String;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const-string p0, "SSL doesn\'t have a valid keystore"

    .line 20
    .line 21
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_2
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStore:Ljava/security/KeyStore;

    .line 26
    .line 27
    if-nez v1, :cond_3

    .line 28
    .line 29
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreInputStream:Ljava/io/InputStream;

    .line 30
    .line 31
    if-nez v1, :cond_3

    .line 32
    .line 33
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStorePath:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v1, :cond_3

    .line 36
    .line 37
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStore:Ljava/security/KeyStore;

    .line 38
    .line 39
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePath:Ljava/lang/String;

    .line 40
    .line 41
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStorePath:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreInputStream:Ljava/io/InputStream;

    .line 44
    .line 45
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreInputStream:Ljava/io/InputStream;

    .line 46
    .line 47
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreType:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreType:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreProvider:Ljava/lang/String;

    .line 52
    .line 53
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreProvider:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePassword:Lorg/eclipse/jetty/util/security/Password;

    .line 56
    .line 57
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStorePassword:Lorg/eclipse/jetty/util/security/Password;

    .line 58
    .line 59
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyManagerFactoryAlgorithm:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustManagerFactoryAlgorithm:Ljava/lang/String;

    .line 62
    .line 63
    :cond_3
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreInputStream:Ljava/io/InputStream;

    .line 64
    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreInputStream:Ljava/io/InputStream;

    .line 68
    .line 69
    if-ne v0, v1, :cond_4

    .line 70
    .line 71
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreInputStream:Ljava/io/InputStream;

    .line 77
    .line 78
    invoke-static {v1, v0}, Lorg/eclipse/jetty/util/IO;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreInputStream:Ljava/io/InputStream;

    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 84
    .line 85
    .line 86
    new-instance v1, Ljava/io/ByteArrayInputStream;

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 93
    .line 94
    .line 95
    iput-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreInputStream:Ljava/io/InputStream;

    .line 96
    .line 97
    new-instance v1, Ljava/io/ByteArrayInputStream;

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-direct {v1, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 104
    .line 105
    .line 106
    iput-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreInputStream:Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    .line 108
    return-void

    .line 109
    :catch_0
    move-exception p0

    .line 110
    invoke-static {p0}, Ll/xpg0;->a(Ljava/lang/Throwable;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    :goto_1
    return-void
.end method

.method public checkNotStarted()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isStarted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v0, "Cannot modify configuration when "

    .line 9
    .line 10
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->getState()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v0, p0}, Ll/qg50;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public customize(Ljavax/net/ssl/SSLEngine;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getWantClientAuth()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getWantClientAuth()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1, v0}, Ljavax/net/ssl/SSLEngine;->setWantClientAuth(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getNeedClientAuth()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getNeedClientAuth()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p1, v0}, Ljavax/net/ssl/SSLEngine;->setNeedClientAuth(Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-virtual {p1}, Ljavax/net/ssl/SSLEngine;->getEnabledCipherSuites()[Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p1}, Ljavax/net/ssl/SSLEngine;->getSupportedCipherSuites()[Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->selectCipherSuites([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Ljavax/net/ssl/SSLEngine;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ljavax/net/ssl/SSLEngine;->getEnabledProtocols()[Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1}, Ljavax/net/ssl/SSLEngine;->getSupportedProtocols()[Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->selectProtocols([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, p0}, Ljavax/net/ssl/SSLEngine;->setEnabledProtocols([Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public doStart()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_context:Ljavax/net/ssl/SSLContext;

    .line 2
    .line 3
    if-nez v0, :cond_b

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStore:Ljava/security/KeyStore;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreInputStream:Ljava/io/InputStream;

    .line 12
    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePath:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStore:Ljava/security/KeyStore;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreInputStream:Ljava/io/InputStream;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStorePath:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    iget-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustAll:Z

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    sget-object v0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 36
    .line 37
    const-string v3, "No keystore or trust store configured.  ACCEPTING UNTRUSTED CERTIFICATES!!!!!"

    .line 38
    .line 39
    new-array v1, v1, [Ljava/lang/Object;

    .line 40
    .line 41
    invoke-interface {v0, v3, v1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    sget-object v0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->TRUST_ALL_CERTS:[Ljavax/net/ssl/TrustManager;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    move-object v0, v2

    .line 48
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_secureRandomAlgorithm:Ljava/lang/String;

    .line 49
    .line 50
    if-nez v1, :cond_1

    .line 51
    .line 52
    move-object v1, v2

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    invoke-static {v1}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;)Ljava/security/SecureRandom;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    :goto_1
    iget-object v3, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslProtocol:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    iput-object v3, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_context:Ljavax/net/ssl/SSLContext;

    .line 65
    .line 66
    invoke-virtual {v3, v2, v0, v1}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkKeyStore()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->loadKeyStore()Ljava/security/KeyStore;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->loadTrustStore()Ljava/security/KeyStore;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    iget-object v4, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_crlPath:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p0, v4}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->loadCRL(Ljava/lang/String;)Ljava/util/Collection;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    iget-boolean v5, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_validateCerts:Z

    .line 88
    .line 89
    if-eqz v5, :cond_8

    .line 90
    .line 91
    if-eqz v0, :cond_8

    .line 92
    .line 93
    iget-object v5, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_certAlias:Ljava/lang/String;

    .line 94
    .line 95
    if-nez v5, :cond_4

    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/security/KeyStore;->aliases()Ljava/util/Enumeration;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    invoke-static {v5}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 106
    .line 107
    .line 108
    move-result v6

    .line 109
    const/4 v7, 0x1

    .line 110
    if-ne v6, v7, :cond_3

    .line 111
    .line 112
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_3
    move-object v1, v2

    .line 120
    :goto_2
    iput-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_certAlias:Ljava/lang/String;

    .line 121
    .line 122
    :cond_4
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_certAlias:Ljava/lang/String;

    .line 123
    .line 124
    if-nez v1, :cond_5

    .line 125
    .line 126
    move-object v1, v2

    .line 127
    goto :goto_3

    .line 128
    :cond_5
    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->getCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    :goto_3
    if-nez v1, :cond_7

    .line 133
    .line 134
    new-instance v0, Ljava/lang/Exception;

    .line 135
    .line 136
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_certAlias:Ljava/lang/String;

    .line 137
    .line 138
    if-nez v1, :cond_6

    .line 139
    .line 140
    const-string p0, ""

    .line 141
    .line 142
    goto :goto_4

    .line 143
    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    const-string v2, " for alias "

    .line 146
    .line 147
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_certAlias:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    :goto_4
    const-string v1, "No certificate found in the keystore"

    .line 160
    .line 161
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-direct {v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    throw v0

    .line 169
    :cond_7
    new-instance v5, Lorg/eclipse/jetty/util/security/CertificateValidator;

    .line 170
    .line 171
    invoke-direct {v5, v3, v4}, Lorg/eclipse/jetty/util/security/CertificateValidator;-><init>(Ljava/security/KeyStore;Ljava/util/Collection;)V

    .line 172
    .line 173
    .line 174
    iget v6, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_maxCertPathLength:I

    .line 175
    .line 176
    invoke-virtual {v5, v6}, Lorg/eclipse/jetty/util/security/CertificateValidator;->setMaxCertPathLength(I)V

    .line 177
    .line 178
    .line 179
    iget-boolean v6, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableCRLDP:Z

    .line 180
    .line 181
    invoke-virtual {v5, v6}, Lorg/eclipse/jetty/util/security/CertificateValidator;->setEnableCRLDP(Z)V

    .line 182
    .line 183
    .line 184
    iget-boolean v6, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableOCSP:Z

    .line 185
    .line 186
    invoke-virtual {v5, v6}, Lorg/eclipse/jetty/util/security/CertificateValidator;->setEnableOCSP(Z)V

    .line 187
    .line 188
    .line 189
    iget-object v6, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_ocspResponderURL:Ljava/lang/String;

    .line 190
    .line 191
    invoke-virtual {v5, v6}, Lorg/eclipse/jetty/util/security/CertificateValidator;->setOcspResponderURL(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v5, v0, v1}, Lorg/eclipse/jetty/util/security/CertificateValidator;->validate(Ljava/security/KeyStore;Ljava/security/cert/Certificate;)V

    .line 195
    .line 196
    .line 197
    :cond_8
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getKeyManagers(Ljava/security/KeyStore;)[Ljavax/net/ssl/KeyManager;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-virtual {p0, v3, v4}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getTrustManagers(Ljava/security/KeyStore;Ljava/util/Collection;)[Ljavax/net/ssl/TrustManager;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    iget-object v3, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_secureRandomAlgorithm:Ljava/lang/String;

    .line 206
    .line 207
    if-nez v3, :cond_9

    .line 208
    .line 209
    goto :goto_5

    .line 210
    :cond_9
    invoke-static {v3}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;)Ljava/security/SecureRandom;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    :goto_5
    iget-object v3, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslProvider:Ljava/lang/String;

    .line 215
    .line 216
    iget-object v4, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslProtocol:Ljava/lang/String;

    .line 217
    .line 218
    if-nez v3, :cond_a

    .line 219
    .line 220
    invoke-static {v4}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    .line 221
    .line 222
    .line 223
    move-result-object v3

    .line 224
    goto :goto_6

    .line 225
    :cond_a
    invoke-static {v4, v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    :goto_6
    iput-object v3, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_context:Ljavax/net/ssl/SSLContext;

    .line 230
    .line 231
    invoke-virtual {v3, v0, v1, v2}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->newSslEngine()Ljavax/net/ssl/SSLEngine;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    sget-object v0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 239
    .line 240
    invoke-virtual {p0}, Ljavax/net/ssl/SSLEngine;->getEnabledProtocols()[Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    invoke-virtual {p0}, Ljavax/net/ssl/SSLEngine;->getSupportedProtocols()[Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    const-string v2, "Enabled Protocols {} of {}"

    .line 261
    .line 262
    invoke-interface {v0, v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 266
    .line 267
    .line 268
    move-result v1

    .line 269
    if-eqz v1, :cond_b

    .line 270
    .line 271
    invoke-virtual {p0}, Ljavax/net/ssl/SSLEngine;->getEnabledCipherSuites()[Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-virtual {p0}, Ljavax/net/ssl/SSLEngine;->getSupportedCipherSuites()[Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 284
    .line 285
    .line 286
    move-result-object p0

    .line 287
    filled-new-array {v1, p0}, [Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    move-result-object p0

    .line 291
    const-string v1, "Enabled Ciphers   {} of {}"

    .line 292
    .line 293
    invoke-interface {v0, v1, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 294
    .line 295
    .line 296
    :cond_b
    return-void
.end method

.method public getCertAlias()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_certAlias:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCrlPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_crlPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExcludeCipherSuites()[Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeCipherSuites:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Set;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-array v0, v0, [Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, [Ljava/lang/String;

    .line 14
    .line 15
    return-object p0
.end method

.method public getExcludeProtocols()[Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeProtocols:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Set;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-array v0, v0, [Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, [Ljava/lang/String;

    .line 14
    .line 15
    return-object p0
.end method

.method public getIncludeCipherSuites()[Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_includeCipherSuites:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Set;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-array v0, v0, [Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, [Ljava/lang/String;

    .line 14
    .line 15
    return-object p0
.end method

.method public getIncludeProtocols()[Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_includeProtocols:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Set;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-array v0, v0, [Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, [Ljava/lang/String;

    .line 14
    .line 15
    return-object p0
.end method

.method public getKeyManagers(Ljava/security/KeyStore;)[Ljavax/net/ssl/KeyManager;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyManagerFactoryAlgorithm:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v1}, Ljavax/net/ssl/KeyManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/KeyManagerFactory;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyManagerPassword:Lorg/eclipse/jetty/util/security/Password;

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    iget-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePassword:Lorg/eclipse/jetty/util/security/Password;

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/security/Password;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :goto_0
    invoke-virtual {v1, p1, v0}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljavax/net/ssl/KeyManagerFactory;->getKeyManagers()[Ljavax/net/ssl/KeyManager;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_certAlias:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    :goto_1
    array-length v1, p1

    .line 40
    if-ge v0, v1, :cond_2

    .line 41
    .line 42
    aget-object v1, p1, v0

    .line 43
    .line 44
    instance-of v1, v1, Ljavax/net/ssl/X509KeyManager;

    .line 45
    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    new-instance v1, Lorg/eclipse/jetty/util/ssl/AliasedX509ExtendedKeyManager;

    .line 49
    .line 50
    iget-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_certAlias:Ljava/lang/String;

    .line 51
    .line 52
    aget-object v3, p1, v0

    .line 53
    .line 54
    check-cast v3, Ljavax/net/ssl/X509KeyManager;

    .line 55
    .line 56
    invoke-direct {v1, v2, v3}, Lorg/eclipse/jetty/util/ssl/AliasedX509ExtendedKeyManager;-><init>(Ljava/lang/String;Ljavax/net/ssl/X509KeyManager;)V

    .line 57
    .line 58
    .line 59
    aput-object v1, p1, v0

    .line 60
    .line 61
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    return-object p1

    .line 65
    :cond_3
    return-object v0
.end method

.method public getKeyStore()Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 6
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePath:Ljava/lang/String;

    return-object p0
.end method

.method public getKeyStore(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyStore;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
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

.method public getKeyStoreInputStream()Ljava/io/InputStream;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkKeyStore()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreInputStream:Ljava/io/InputStream;

    .line 5
    .line 6
    return-object p0
.end method

.method public getKeyStorePath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getKeyStoreProvider()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreProvider:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getKeyStoreType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaxCertPathLength()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_maxCertPathLength:I

    .line 2
    .line 3
    return p0
.end method

.method public getNeedClientAuth()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_needClientAuth:Z

    .line 2
    .line 3
    return p0
.end method

.method public getOcspResponderURL()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_ocspResponderURL:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProtocol()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslProtocol:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProvider()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslProvider:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSecureRandomAlgorithm()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_secureRandomAlgorithm:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSslContext()Ljavax/net/ssl/SSLContext;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isStarted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_context:Ljavax/net/ssl/SSLContext;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->getState()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public getSslKeyManagerFactoryAlgorithm()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyManagerFactoryAlgorithm:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSslSessionCacheSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslSessionCacheSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getSslSessionTimeout()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslSessionTimeout:I

    .line 2
    .line 3
    return p0
.end method

.method public getTrustManagerFactoryAlgorithm()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustManagerFactoryAlgorithm:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrustManagers(Ljava/security/KeyStore;Ljava/util/Collection;)[Ljavax/net/ssl/TrustManager;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/security/KeyStore;",
            "Ljava/util/Collection<",
            "+",
            "Ljava/security/cert/CRL;",
            ">;)[",
            "Ljavax/net/ssl/TrustManager;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    iget-boolean v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_validatePeerCerts:Z

    .line 4
    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustManagerFactoryAlgorithm:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "PKIX"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    new-instance v0, Ljava/security/cert/PKIXBuilderParameters;

    .line 18
    .line 19
    new-instance v1, Ljava/security/cert/X509CertSelector;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/security/cert/X509CertSelector;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-direct {v0, p1, v1}, Ljava/security/cert/PKIXBuilderParameters;-><init>(Ljava/security/KeyStore;Ljava/security/cert/CertSelector;)V

    .line 25
    .line 26
    .line 27
    iget p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_maxCertPathLength:I

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/security/cert/PKIXBuilderParameters;->setMaxPathLength(I)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    invoke-virtual {v0, p1}, Ljava/security/cert/PKIXParameters;->setRevocationEnabled(Z)V

    .line 34
    .line 35
    .line 36
    if-eqz p2, :cond_0

    .line 37
    .line 38
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_0

    .line 43
    .line 44
    new-instance p1, Ljava/security/cert/CollectionCertStoreParameters;

    .line 45
    .line 46
    invoke-direct {p1, p2}, Ljava/security/cert/CollectionCertStoreParameters;-><init>(Ljava/util/Collection;)V

    .line 47
    .line 48
    .line 49
    const-string p2, "Collection"

    .line 50
    .line 51
    invoke-static {p2, p1}, Ljava/security/cert/CertStore;->getInstance(Ljava/lang/String;Ljava/security/cert/CertStoreParameters;)Ljava/security/cert/CertStore;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {v0, p1}, Ljava/security/cert/PKIXParameters;->addCertStore(Ljava/security/cert/CertStore;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    iget-boolean p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableCRLDP:Z

    .line 59
    .line 60
    const-string p2, "true"

    .line 61
    .line 62
    if-eqz p1, :cond_1

    .line 63
    .line 64
    const-string p1, "com.sun.security.enableCRLDP"

    .line 65
    .line 66
    invoke-static {p1, p2}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    :cond_1
    iget-boolean p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableOCSP:Z

    .line 70
    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    const-string p1, "ocsp.enable"

    .line 74
    .line 75
    invoke-static {p1, p2}, Ljava/security/Security;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_ocspResponderURL:Ljava/lang/String;

    .line 79
    .line 80
    if-eqz p1, :cond_2

    .line 81
    .line 82
    const-string p2, "ocsp.responderURL"

    .line 83
    .line 84
    invoke-static {p2, p1}, Ljava/security/Security;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_2
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustManagerFactoryAlgorithm:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p0}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    new-instance p1, Ljavax/net/ssl/CertPathTrustManagerParameters;

    .line 94
    .line 95
    invoke-direct {p1, v0}, Ljavax/net/ssl/CertPathTrustManagerParameters;-><init>(Ljava/security/cert/CertPathParameters;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, p1}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljavax/net/ssl/ManagerFactoryParameters;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0

    .line 106
    :cond_3
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustManagerFactoryAlgorithm:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {p0}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p0, p1}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    return-object p0

    .line 120
    :cond_4
    const/4 p0, 0x0

    .line 121
    return-object p0
.end method

.method public getTrustStore()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStorePath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrustStoreInputStream()Ljava/io/InputStream;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkKeyStore()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreInputStream:Ljava/io/InputStream;

    .line 5
    .line 6
    return-object p0
.end method

.method public getTrustStoreProvider()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreProvider:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrustStoreType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getValidateCerts()Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_validateCerts:Z

    .line 2
    .line 3
    return p0
.end method

.method public getWantClientAuth()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_wantClientAuth:Z

    .line 2
    .line 3
    return p0
.end method

.method public isAllowRenegotiate()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_allowRenegotiate:Z

    .line 2
    .line 3
    return p0
.end method

.method public isEnableCRLDP()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableCRLDP:Z

    .line 2
    .line 3
    return p0
.end method

.method public isEnableOCSP()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableOCSP:Z

    .line 2
    .line 3
    return p0
.end method

.method public isSessionCachingEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sessionCachingEnabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public isTrustAll()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustAll:Z

    .line 2
    .line 3
    return p0
.end method

.method public isValidateCerts()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_validateCerts:Z

    .line 2
    .line 3
    return p0
.end method

.method public isValidatePeerCerts()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_validatePeerCerts:Z

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

.method public loadKeyStore()Ljava/security/KeyStore;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStore:Ljava/security/KeyStore;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreInputStream:Ljava/io/InputStream;

    .line 7
    .line 8
    iget-object v3, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePath:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v4, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreType:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v5, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreProvider:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePassword:Lorg/eclipse/jetty/util/security/Password;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    :goto_0
    move-object v1, p0

    .line 20
    move-object v6, v0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/security/Password;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    goto :goto_0

    .line 27
    :goto_1
    invoke-virtual/range {v1 .. v6}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getKeyStore(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyStore;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public loadTrustStore()Ljava/security/KeyStore;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStore:Ljava/security/KeyStore;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreInputStream:Ljava/io/InputStream;

    .line 7
    .line 8
    iget-object v3, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStorePath:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v4, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreType:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v5, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreProvider:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStorePassword:Lorg/eclipse/jetty/util/security/Password;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    :goto_0
    move-object v1, p0

    .line 20
    move-object v6, v0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/security/Password;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    goto :goto_0

    .line 27
    :goto_1
    invoke-virtual/range {v1 .. v6}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getKeyStore(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyStore;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public newSslEngine()Ljavax/net/ssl/SSLEngine;
    .locals 1

    .line 22
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_context:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->createSSLEngine()Ljavax/net/ssl/SSLEngine;

    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->customize(Ljavax/net/ssl/SSLEngine;)V

    return-object v0
.end method

.method public newSslEngine(Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->isSessionCachingEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_context:Ljavax/net/ssl/SSLContext;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1, p1, p2}, Ljavax/net/ssl/SSLContext;->createSSLEngine(Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->createSSLEngine()Ljavax/net/ssl/SSLEngine;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->customize(Ljavax/net/ssl/SSLEngine;)V

    .line 19
    .line 20
    .line 21
    return-object p1
.end method

.method public newSslServerSocket(Ljava/lang/String;II)Ljavax/net/ssl/SSLServerSocket;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_context:Ljavax/net/ssl/SSLContext;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getServerSocketFactory()Ljavax/net/ssl/SSLServerSocketFactory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p2, p3}, Ljavax/net/ServerSocketFactory;->createServerSocket(II)Ljava/net/ServerSocket;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p2, p3, p1}, Ljavax/net/ServerSocketFactory;->createServerSocket(IILjava/net/InetAddress;)Ljava/net/ServerSocket;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    :goto_0
    check-cast p1, Ljavax/net/ssl/SSLServerSocket;

    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getWantClientAuth()Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getWantClientAuth()Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    invoke-virtual {p1, p2}, Ljavax/net/ssl/SSLServerSocket;->setWantClientAuth(Z)V

    .line 35
    .line 36
    .line 37
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getNeedClientAuth()Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getNeedClientAuth()Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    invoke-virtual {p1, p2}, Ljavax/net/ssl/SSLServerSocket;->setNeedClientAuth(Z)V

    .line 48
    .line 49
    .line 50
    :cond_2
    invoke-virtual {p1}, Ljavax/net/ssl/SSLServerSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p1}, Ljavax/net/ssl/SSLServerSocket;->getSupportedCipherSuites()[Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-virtual {p0, p2, p3}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->selectCipherSuites([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p1, p2}, Ljavax/net/ssl/SSLServerSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Ljavax/net/ssl/SSLServerSocket;->getEnabledProtocols()[Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {p1}, Ljavax/net/ssl/SSLServerSocket;->getSupportedProtocols()[Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    invoke-virtual {p0, p2, p3}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->selectProtocols([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p1, p0}, Ljavax/net/ssl/SSLServerSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-object p1
.end method

.method public newSslSocket()Ljavax/net/ssl/SSLSocket;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_context:Ljavax/net/ssl/SSLContext;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljavax/net/ssl/SSLSocket;

    .line 12
    .line 13
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getWantClientAuth()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getWantClientAuth()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLSocket;->setWantClientAuth(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getNeedClientAuth()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getNeedClientAuth()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLSocket;->setNeedClientAuth(Z)V

    .line 37
    .line 38
    .line 39
    :cond_1
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSupportedCipherSuites()[Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {p0, v1, v2}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->selectCipherSuites([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSupportedProtocols()[Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {p0, v1, v2}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->selectProtocols([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-object v0
.end method

.method public selectCipherSuites([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_includeCipherSuites:Ljava/util/Set;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeCipherSuites:Ljava/util/Set;

    .line 48
    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    invoke-interface {v0, p0}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    :cond_3
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    new-array p0, p0, [Ljava/lang/String;

    .line 59
    .line 60
    invoke-interface {v0, p0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, [Ljava/lang/String;

    .line 65
    .line 66
    return-object p0
.end method

.method public selectProtocols([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_includeProtocols:Ljava/util/Set;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeProtocols:Ljava/util/Set;

    .line 48
    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    invoke-interface {v0, p0}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    :cond_3
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    new-array p0, p0, [Ljava/lang/String;

    .line 59
    .line 60
    invoke-interface {v0, p0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, [Ljava/lang/String;

    .line 65
    .line 66
    return-object p0
.end method

.method public setAllowRenegotiate(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_allowRenegotiate:Z

    .line 5
    .line 6
    return-void
.end method

.method public setCertAlias(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_certAlias:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setCrlPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_crlPath:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setEnableCRLDP(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableCRLDP:Z

    .line 5
    .line 6
    return-void
.end method

.method public setEnableOCSP(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_enableOCSP:Z

    .line 5
    .line 6
    return-void
.end method

.method public varargs setExcludeCipherSuites([Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeCipherSuites:Ljava/util/Set;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeCipherSuites:Ljava/util/Set;

    .line 10
    .line 11
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public varargs setExcludeProtocols([Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeProtocols:Ljava/util/Set;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_excludeProtocols:Ljava/util/Set;

    .line 10
    .line 11
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public varargs setIncludeCipherSuites([Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-direct {v0, p1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_includeCipherSuites:Ljava/util/Set;

    .line 14
    .line 15
    return-void
.end method

.method public varargs setIncludeProtocols([Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-direct {v0, p1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_includeProtocols:Ljava/util/Set;

    .line 14
    .line 15
    return-void
.end method

.method public setKeyManagerPassword(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    const-string v0, "org.eclipse.jetty.ssl.keypassword"

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, p1, v1}, Lorg/eclipse/jetty/util/security/Password;->getPassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jetty/util/security/Password;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyManagerPassword:Lorg/eclipse/jetty/util/security/Password;

    .line 12
    .line 13
    return-void
.end method

.method public setKeyStore(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePath:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setKeyStore(Ljava/security/KeyStore;)V
    .locals 0

    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 8
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStore:Ljava/security/KeyStore;

    return-void
.end method

.method public setKeyStoreInputStream(Ljava/io/InputStream;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreInputStream:Ljava/io/InputStream;

    .line 5
    .line 6
    return-void
.end method

.method public setKeyStorePassword(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    const-string v0, "org.eclipse.jetty.ssl.password"

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, p1, v1}, Lorg/eclipse/jetty/util/security/Password;->getPassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jetty/util/security/Password;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePassword:Lorg/eclipse/jetty/util/security/Password;

    .line 12
    .line 13
    return-void
.end method

.method public setKeyStorePath(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePath:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setKeyStoreProvider(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreProvider:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setKeyStoreResource(Lorg/eclipse/jetty/util/resource/Resource;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/resource/Resource;->getInputStream()Ljava/io/InputStream;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreInputStream:Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "Unable to get resource input stream for resource "

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw p0
.end method

.method public setKeyStoreType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStoreType:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setMaxCertPathLength(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_maxCertPathLength:I

    .line 5
    .line 6
    return-void
.end method

.method public setNeedClientAuth(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_needClientAuth:Z

    .line 5
    .line 6
    return-void
.end method

.method public setOcspResponderURL(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_ocspResponderURL:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setProtocol(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslProtocol:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setProvider(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslProvider:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setSecureRandomAlgorithm(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_secureRandomAlgorithm:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setSessionCachingEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sessionCachingEnabled:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSslContext(Ljavax/net/ssl/SSLContext;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_context:Ljavax/net/ssl/SSLContext;

    .line 5
    .line 6
    return-void
.end method

.method public setSslKeyManagerFactoryAlgorithm(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyManagerFactoryAlgorithm:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setSslSessionCacheSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslSessionCacheSize:I

    .line 2
    .line 3
    return-void
.end method

.method public setSslSessionTimeout(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_sslSessionTimeout:I

    .line 2
    .line 3
    return-void
.end method

.method public setTrustAll(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustAll:Z

    .line 2
    .line 3
    return-void
.end method

.method public setTrustManagerFactoryAlgorithm(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustManagerFactoryAlgorithm:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setTrustStore(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStorePath:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setTrustStore(Ljava/security/KeyStore;)V
    .locals 0

    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 8
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStore:Ljava/security/KeyStore;

    return-void
.end method

.method public setTrustStoreInputStream(Ljava/io/InputStream;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreInputStream:Ljava/io/InputStream;

    .line 5
    .line 6
    return-void
.end method

.method public setTrustStorePassword(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    const-string v0, "org.eclipse.jetty.ssl.password"

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, p1, v1}, Lorg/eclipse/jetty/util/security/Password;->getPassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jetty/util/security/Password;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStorePassword:Lorg/eclipse/jetty/util/security/Password;

    .line 12
    .line 13
    return-void
.end method

.method public setTrustStoreProvider(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreProvider:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setTrustStoreResource(Lorg/eclipse/jetty/util/resource/Resource;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/resource/Resource;->getInputStream()Ljava/io/InputStream;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreInputStream:Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "Unable to get resource input stream for resource "

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw p0
.end method

.method public setTrustStoreType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStoreType:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public setValidateCerts(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_validateCerts:Z

    .line 5
    .line 6
    return-void
.end method

.method public setValidatePeerCerts(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_validatePeerCerts:Z

    .line 5
    .line 6
    return-void
.end method

.method public setWantClientAuth(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->checkNotStarted()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_wantClientAuth:Z

    .line 5
    .line 6
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_keyStorePath:Ljava/lang/String;

    .line 18
    .line 19
    iget-object p0, p0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->_trustStorePath:Ljava/lang/String;

    .line 20
    .line 21
    filled-new-array {v0, v1, v2, p0}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "%s@%x(%s,%s)"

    .line 26
    .line 27
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method
