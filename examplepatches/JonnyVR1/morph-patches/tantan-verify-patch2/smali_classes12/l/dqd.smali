.class public Ll/dqd;
.super Ll/epf0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/epf0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/immomo/mmdns/MDDNSEntrance;->getInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mmdns/MDDNSEntrance;->requestSucceedForDomain(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Lcom/immomo/mmdns/MDDNSEntrance;->getInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mmdns/MDDNSEntrance;->requestFailedForDomain(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/immomo/mmdns/MDDNSEntrance;->getInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mmdns/MDDNSEntrance;->getUsableHost(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public c(Ljava/lang/String;Z)[Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/immomo/mmdns/MDDNSEntrance;->getInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mmdns/MDDNSEntrance;->getUsableHostList(Ljava/lang/String;Z)[Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/immomo/mmdns/MDDNSEntrance;->getInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mmdns/MDDNSEntrance;->useDNS(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
