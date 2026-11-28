.class public final synthetic Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;"
    method = "wrap$lambda$0"
    proto = "(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;Lnicoid/network238/okhttp3/internal/dns/Question;)Lnicoid/network238/okhttp3/internal/dns/DnsQuery;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

.field public final synthetic f$1:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$1;->f$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$1;->f$1:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;

    return-void
.end method


# virtual methods
.method public final newQuery(Lnicoid/network238/okhttp3/internal/dns/Question;)Lnicoid/network238/okhttp3/internal/dns/DnsQuery;
    .registers 4

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$1;->f$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$1;->f$1:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;

    invoke-static {v0, v1, p1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->wrap$lambda$0(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;Lnicoid/network238/okhttp3/internal/dns/Question;)Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    move-result-object p1

    return-object p1
.end method
