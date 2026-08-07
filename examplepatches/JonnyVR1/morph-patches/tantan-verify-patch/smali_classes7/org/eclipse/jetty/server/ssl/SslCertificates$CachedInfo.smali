.class Lorg/eclipse/jetty/server/ssl/SslCertificates$CachedInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/ssl/SslCertificates;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CachedInfo"
.end annotation


# instance fields
.field private final _certs:[Ljava/security/cert/X509Certificate;

.field private final _idStr:Ljava/lang/String;

.field private final _keySize:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;[Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/server/ssl/SslCertificates$CachedInfo;->_keySize:Ljava/lang/Integer;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/server/ssl/SslCertificates$CachedInfo;->_certs:[Ljava/security/cert/X509Certificate;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/eclipse/jetty/server/ssl/SslCertificates$CachedInfo;->_idStr:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getCerts()[Ljava/security/cert/X509Certificate;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/ssl/SslCertificates$CachedInfo;->_certs:[Ljava/security/cert/X509Certificate;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdStr()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/ssl/SslCertificates$CachedInfo;->_idStr:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getKeySize()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/ssl/SslCertificates$CachedInfo;->_keySize:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method
