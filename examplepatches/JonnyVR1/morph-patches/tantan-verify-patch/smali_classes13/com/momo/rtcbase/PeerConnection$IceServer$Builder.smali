.class public Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/PeerConnection$IceServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private hostname:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private tlsAlpnProtocols:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private tlsCertPolicy:Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;

.field private tlsEllipticCurves:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final urls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private username:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->username:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->password:Ljava/lang/String;

    .line 9
    .line 10
    sget-object v1, Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;->TLS_CERT_POLICY_SECURE:Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;

    .line 11
    .line 12
    iput-object v1, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->tlsCertPolicy:Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->hostname:Ljava/lang/String;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->urls:Ljava/util/List;

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string p0, "urls == null || urls.isEmpty(): "

    .line 28
    .line 29
    invoke-static {p0, p1}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    throw p0
.end method

.method public synthetic constructor <init>(Ljava/util/List;Lcom/momo/rtcbase/PeerConnection$1;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;-><init>(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public createIceServer()Lcom/momo/rtcbase/PeerConnection$IceServer;
    .locals 10

    .line 1
    new-instance v0, Lcom/momo/rtcbase/PeerConnection$IceServer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->urls:Ljava/util/List;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->urls:Ljava/util/List;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->username:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v4, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->password:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v5, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->tlsCertPolicy:Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;

    .line 19
    .line 20
    iget-object v6, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->hostname:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v7, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->tlsAlpnProtocols:Ljava/util/List;

    .line 23
    .line 24
    iget-object v8, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->tlsEllipticCurves:Ljava/util/List;

    .line 25
    .line 26
    const/4 v9, 0x0

    .line 27
    invoke-direct/range {v0 .. v9}, Lcom/momo/rtcbase/PeerConnection$IceServer;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lcom/momo/rtcbase/PeerConnection$1;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public setHostname(Ljava/lang/String;)Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->hostname:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPassword(Ljava/lang/String;)Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->password:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setTlsAlpnProtocols(Ljava/util/List;)Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->tlsAlpnProtocols:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setTlsCertPolicy(Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;)Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->tlsCertPolicy:Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;

    .line 2
    .line 3
    return-object p0
.end method

.method public setTlsEllipticCurves(Ljava/util/List;)Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->tlsEllipticCurves:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setUsername(Ljava/lang/String;)Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;->username:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
