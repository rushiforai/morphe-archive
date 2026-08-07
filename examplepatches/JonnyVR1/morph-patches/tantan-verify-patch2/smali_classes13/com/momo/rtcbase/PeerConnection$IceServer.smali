.class public Lcom/momo/rtcbase/PeerConnection$IceServer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/PeerConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IceServer"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;
    }
.end annotation


# instance fields
.field public final hostname:Ljava/lang/String;

.field public final password:Ljava/lang/String;

.field public final tlsAlpnProtocols:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final tlsCertPolicy:Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;

.field public final tlsEllipticCurves:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final uri:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public final urls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final username:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 87
    const-string v0, ""

    invoke-direct {p0, p1, v0, v0}, Lcom/momo/rtcbase/PeerConnection$IceServer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 88
    sget-object v0, Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;->TLS_CERT_POLICY_SECURE:Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/momo/rtcbase/PeerConnection$IceServer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;)V
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 89
    const-string v5, ""

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/momo/rtcbase/PeerConnection$IceServer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;Ljava/lang/String;)V
    .locals 9
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 90
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v8}, Lcom/momo/rtcbase/PeerConnection$IceServer;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
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
    const/4 v0, 0x0

    .line 5
    if-eqz p1, :cond_5

    .line 6
    .line 7
    if-eqz p2, :cond_5

    .line 8
    .line 9
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_5

    .line 14
    .line 15
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ljava/lang/String;

    .line 30
    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const-string p0, "urls element is null: "

    .line 35
    .line 36
    invoke-static {p0, p2}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    throw v0

    .line 40
    :cond_1
    if-eqz p3, :cond_4

    .line 41
    .line 42
    if-eqz p4, :cond_3

    .line 43
    .line 44
    if-eqz p6, :cond_2

    .line 45
    .line 46
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->uri:Ljava/lang/String;

    .line 47
    .line 48
    iput-object p2, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->urls:Ljava/util/List;

    .line 49
    .line 50
    iput-object p3, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->username:Ljava/lang/String;

    .line 51
    .line 52
    iput-object p4, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->password:Ljava/lang/String;

    .line 53
    .line 54
    iput-object p5, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->tlsCertPolicy:Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;

    .line 55
    .line 56
    iput-object p6, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->hostname:Ljava/lang/String;

    .line 57
    .line 58
    iput-object p7, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->tlsAlpnProtocols:Ljava/util/List;

    .line 59
    .line 60
    iput-object p8, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->tlsEllipticCurves:Ljava/util/List;

    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    const-string p0, "hostname == null"

    .line 64
    .line 65
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    throw v0

    .line 69
    :cond_3
    const-string p0, "password == null"

    .line 70
    .line 71
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    throw v0

    .line 75
    :cond_4
    const-string p0, "username == null"

    .line 76
    .line 77
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    throw v0

    .line 81
    :cond_5
    const-string p0, "uri == null || urls == null || urls.isEmpty()"

    .line 82
    .line 83
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    throw v0
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lcom/momo/rtcbase/PeerConnection$1;)V
    .locals 0

    .line 91
    invoke-direct/range {p0 .. p8}, Lcom/momo/rtcbase/PeerConnection$IceServer;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public static builder(Ljava/lang/String;)Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, p0, v1}, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;-><init>(Ljava/util/List;Lcom/momo/rtcbase/PeerConnection$1;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static builder(Ljava/util/List;)Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;"
        }
    .end annotation

    .line 12
    new-instance v0, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/momo/rtcbase/PeerConnection$IceServer$Builder;-><init>(Ljava/util/List;Lcom/momo/rtcbase/PeerConnection$1;)V

    return-object v0
.end method


# virtual methods
.method public getHostname()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "IceServer"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->hostname:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "IceServer"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->password:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTlsAlpnProtocols()Ljava/util/List;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "IceServer"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->tlsAlpnProtocols:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTlsCertPolicy()Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "IceServer"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->tlsCertPolicy:Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTlsEllipticCurves()Ljava/util/List;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "IceServer"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->tlsEllipticCurves:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUrls()Ljava/util/List;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "IceServer"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->urls:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "IceServer"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->username:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->urls:Ljava/util/List;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " ["

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->username:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, ":"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->password:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, "] ["

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->tlsCertPolicy:Lcom/momo/rtcbase/PeerConnection$TlsCertPolicy;

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->hostname:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v2, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->tlsAlpnProtocols:Ljava/util/List;

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$IceServer;->tlsEllipticCurves:Ljava/util/List;

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string p0, "]"

    .line 66
    .line 67
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method
