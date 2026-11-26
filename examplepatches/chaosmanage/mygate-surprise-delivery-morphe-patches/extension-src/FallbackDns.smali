.class public final Lcom/mygate/user/quickapprove/FallbackDns;
.super Ljava/lang/Object;
.implements Lokhttp3/Dns;

# This resolver leaves MyGate's default DNS entirely intact unless it specifically
# throws UnknownHostException for ack.mygate.in. Its two fallback addresses are the
# currently resolved Cloudflare edge addresses of the SAME HTTPS host. OkHttp still
# uses original hostname/SNI and performs full TLS certificate verification.

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public a(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    :try_start_dns
    sget-object v0, Lokhttp3/Dns;->a:Lokhttp3/Dns;
    invoke-interface {v0, p1}, Lokhttp3/Dns;->a(Ljava/lang/String;)Ljava/util/List;
    move-result-object v0
    return-object v0
    :try_end_dns
    .catch Ljava/net/UnknownHostException; {:try_start_dns .. :try_end_dns} :dns_error

    :dns_error
    move-exception v0
    const-string v1, "ack.mygate.in"
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :rethrow_original

    new-instance v1, Ljava/util/ArrayList;
    const/4 v2, 0x2
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    # Numeric literals are parsed without another DNS request.
    const-string v2, "104.18.14.11"
    invoke-static {v2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "104.18.15.11"
    invoke-static {v2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v1

    :rethrow_original
    throw v0
.end method
