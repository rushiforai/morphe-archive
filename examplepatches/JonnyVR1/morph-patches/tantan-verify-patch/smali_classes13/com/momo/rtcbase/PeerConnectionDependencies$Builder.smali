.class public Lcom/momo/rtcbase/PeerConnectionDependencies$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/PeerConnectionDependencies;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private observer:Lcom/momo/rtcbase/PeerConnection$Observer;

.field private sslCertificateVerifier:Lcom/momo/rtcbase/SSLCertificateVerifier;


# direct methods
.method private constructor <init>(Lcom/momo/rtcbase/PeerConnection$Observer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionDependencies$Builder;->observer:Lcom/momo/rtcbase/PeerConnection$Observer;

    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/rtcbase/PeerConnection$Observer;Lcom/momo/rtcbase/PeerConnectionDependencies$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/PeerConnectionDependencies$Builder;-><init>(Lcom/momo/rtcbase/PeerConnection$Observer;)V

    return-void
.end method


# virtual methods
.method public createPeerConnectionDependencies()Lcom/momo/rtcbase/PeerConnectionDependencies;
    .locals 3

    .line 1
    new-instance v0, Lcom/momo/rtcbase/PeerConnectionDependencies;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/rtcbase/PeerConnectionDependencies$Builder;->observer:Lcom/momo/rtcbase/PeerConnection$Observer;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnectionDependencies$Builder;->sslCertificateVerifier:Lcom/momo/rtcbase/SSLCertificateVerifier;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v0, v1, p0, v2}, Lcom/momo/rtcbase/PeerConnectionDependencies;-><init>(Lcom/momo/rtcbase/PeerConnection$Observer;Lcom/momo/rtcbase/SSLCertificateVerifier;Lcom/momo/rtcbase/PeerConnectionDependencies$1;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public setSSLCertificateVerifier(Lcom/momo/rtcbase/SSLCertificateVerifier;)Lcom/momo/rtcbase/PeerConnectionDependencies$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionDependencies$Builder;->sslCertificateVerifier:Lcom/momo/rtcbase/SSLCertificateVerifier;

    .line 2
    .line 3
    return-object p0
.end method
