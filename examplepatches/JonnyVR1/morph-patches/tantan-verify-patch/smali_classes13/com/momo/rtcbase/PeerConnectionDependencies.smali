.class public final Lcom/momo/rtcbase/PeerConnectionDependencies;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/PeerConnectionDependencies$Builder;
    }
.end annotation


# instance fields
.field private final observer:Lcom/momo/rtcbase/PeerConnection$Observer;

.field private final sslCertificateVerifier:Lcom/momo/rtcbase/SSLCertificateVerifier;


# direct methods
.method private constructor <init>(Lcom/momo/rtcbase/PeerConnection$Observer;Lcom/momo/rtcbase/SSLCertificateVerifier;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionDependencies;->observer:Lcom/momo/rtcbase/PeerConnection$Observer;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/rtcbase/PeerConnectionDependencies;->sslCertificateVerifier:Lcom/momo/rtcbase/SSLCertificateVerifier;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/rtcbase/PeerConnection$Observer;Lcom/momo/rtcbase/SSLCertificateVerifier;Lcom/momo/rtcbase/PeerConnectionDependencies$1;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/PeerConnectionDependencies;-><init>(Lcom/momo/rtcbase/PeerConnection$Observer;Lcom/momo/rtcbase/SSLCertificateVerifier;)V

    return-void
.end method

.method public static builder(Lcom/momo/rtcbase/PeerConnection$Observer;)Lcom/momo/rtcbase/PeerConnectionDependencies$Builder;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/rtcbase/PeerConnectionDependencies$Builder;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/momo/rtcbase/PeerConnectionDependencies$Builder;-><init>(Lcom/momo/rtcbase/PeerConnection$Observer;Lcom/momo/rtcbase/PeerConnectionDependencies$1;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method


# virtual methods
.method public getObserver()Lcom/momo/rtcbase/PeerConnection$Observer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnectionDependencies;->observer:Lcom/momo/rtcbase/PeerConnection$Observer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSSLCertificateVerifier()Lcom/momo/rtcbase/SSLCertificateVerifier;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnectionDependencies;->sslCertificateVerifier:Lcom/momo/rtcbase/SSLCertificateVerifier;

    .line 2
    .line 3
    return-object p0
.end method
