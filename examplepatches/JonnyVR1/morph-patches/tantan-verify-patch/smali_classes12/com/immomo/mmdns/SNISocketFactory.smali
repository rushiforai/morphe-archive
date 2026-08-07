.class public Lcom/immomo/mmdns/SNISocketFactory;
.super Ljavax/net/ssl/SSLSocketFactory;
.source "SourceFile"

# interfaces
.implements Lokhttp3/internal/connection/RealConnection$WithSniInfo;


# instance fields
.field private configureTlsExtensions:Z

.field private mKeyManagers:[Ljavax/net/ssl/KeyManager;

.field private peerHost:Ljava/lang/String;

.field private trustManager:[Ljavax/net/ssl/TrustManager;


# direct methods
.method public constructor <init>(Ljava/lang/String;[Ljavax/net/ssl/TrustManager;[Ljavax/net/ssl/KeyManager;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljavax/net/ssl/SSLSocketFactory;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/immomo/mmdns/SNISocketFactory;->configureTlsExtensions:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/immomo/mmdns/SNISocketFactory;->peerHost:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/immomo/mmdns/SNISocketFactory;->trustManager:[Ljavax/net/ssl/TrustManager;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/immomo/mmdns/SNISocketFactory;->mKeyManagers:[Ljavax/net/ssl/KeyManager;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public createSocket()Ljava/net/Socket;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    invoke-super {p0}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object p0

    return-object p0
.end method

.method public createSocket(Ljava/lang/String;I)Ljava/net/Socket;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 127
    const/4 p0, 0x0

    return-object p0
.end method

.method public createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 124
    const/4 p0, 0x0

    return-object p0
.end method

.method public createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 125
    const/4 p0, 0x0

    return-object p0
.end method

.method public createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 126
    const/4 p0, 0x0

    return-object p0
.end method

.method public createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/mmdns/SNISocketFactory;->peerHost:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p2, p0, Lcom/immomo/mmdns/SNISocketFactory;->peerHost:Ljava/lang/String;

    .line 6
    .line 7
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "customized createSocket. host: "

    .line 10
    .line 11
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/mmdns/SNISocketFactory;->peerHost:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    const-string v0, "MMDNS"

    .line 24
    .line 25
    invoke-static {v0, p2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    if-eqz p4, :cond_1

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/net/Socket;->close()V

    .line 35
    .line 36
    .line 37
    :cond_1
    const/4 p1, 0x0

    .line 38
    invoke-static {}, Lcom/immomo/mmdns/MDDNSEntrance;->getSslSessionCache()Landroid/net/SSLSessionCache;

    .line 39
    .line 40
    .line 41
    move-result-object p4

    .line 42
    invoke-static {p1, p4}, Landroid/net/SSLCertificateSocketFactory;->getDefault(ILandroid/net/SSLSessionCache;)Ljavax/net/ssl/SSLSocketFactory;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Landroid/net/SSLCertificateSocketFactory;

    .line 47
    .line 48
    iget-object p4, p0, Lcom/immomo/mmdns/SNISocketFactory;->trustManager:[Ljavax/net/ssl/TrustManager;

    .line 49
    .line 50
    if-eqz p4, :cond_2

    .line 51
    .line 52
    invoke-virtual {p1, p4}, Landroid/net/SSLCertificateSocketFactory;->setTrustManagers([Ljavax/net/ssl/TrustManager;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    iget-object p4, p0, Lcom/immomo/mmdns/SNISocketFactory;->mKeyManagers:[Ljavax/net/ssl/KeyManager;

    .line 56
    .line 57
    if-eqz p4, :cond_3

    .line 58
    .line 59
    invoke-virtual {p1, p4}, Landroid/net/SSLCertificateSocketFactory;->setKeyManagers([Ljavax/net/ssl/KeyManager;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    invoke-virtual {p1, p2, p3}, Landroid/net/SSLCertificateSocketFactory;->createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    check-cast p2, Ljavax/net/ssl/SSLSocket;

    .line 67
    .line 68
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getSupportedProtocols()[Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    invoke-virtual {p2, p3}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-boolean p3, p0, Lcom/immomo/mmdns/SNISocketFactory;->configureTlsExtensions:Z

    .line 76
    .line 77
    if-eqz p3, :cond_5

    .line 78
    .line 79
    iget-object p3, p0, Lcom/immomo/mmdns/SNISocketFactory;->peerHost:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p1, p2, p3}, Landroid/net/SSLCertificateSocketFactory;->setHostname(Ljava/net/Socket;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {}, Ljavax/net/ssl/HttpsURLConnection;->getDefaultHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    iget-object p4, p0, Lcom/immomo/mmdns/SNISocketFactory;->peerHost:Ljava/lang/String;

    .line 93
    .line 94
    invoke-interface {p3, p4, p1}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_4
    new-instance p1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/immomo/mmdns/SNISocketFactory;->peerHost:Ljava/lang/String;

    .line 104
    .line 105
    new-instance p2, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string p3, "Cannot verify hostname: "

    .line 108
    .line 109
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-direct {p1, p0}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    throw p1

    .line 123
    :cond_5
    :goto_0
    return-object p2
.end method

.method public enableConfigureTlsExtensions()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/immomo/mmdns/SNISocketFactory;->configureTlsExtensions:Z

    .line 3
    .line 4
    return-void
.end method

.method public getDefaultCipherSuites()[Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Ljava/lang/String;

    .line 3
    .line 4
    return-object p0
.end method

.method public getSniHostname()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mmdns/SNISocketFactory;->peerHost:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSupportedCipherSuites()[Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Ljava/lang/String;

    .line 3
    .line 4
    return-object p0
.end method
