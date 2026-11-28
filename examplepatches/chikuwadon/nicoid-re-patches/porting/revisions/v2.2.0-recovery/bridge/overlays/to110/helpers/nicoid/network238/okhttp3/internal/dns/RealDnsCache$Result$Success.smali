.class public final Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Success;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Success"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0014\u0010\u0004\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Success;",
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;",
        "revalidateAt",
        "Lnicoid/network238/kotlin/time/ComparableTimeMark;",
        "expireAt",
        "message",
        "Lnicoid/network238/okhttp3/internal/dns/DnsMessage;",
        "<init>",
        "(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V",
        "getRevalidateAt",
        "()Lnicoid/network238/kotlin/time/ComparableTimeMark;",
        "getExpireAt",
        "getMessage",
        "()Lnicoid/network238/okhttp3/internal/dns/DnsMessage;",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final expireAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

.field private final message:Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

.field private final revalidateAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 303
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 304
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Success;->revalidateAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    .line 305
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Success;->expireAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    .line 306
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Success;->message:Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    return-void
.end method


# virtual methods
.method public getExpireAt()Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .registers 2

    .line 305
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Success;->expireAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    return-object v0
.end method

.method public final getMessage()Lnicoid/network238/okhttp3/internal/dns/DnsMessage;
    .registers 2

    .line 306
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Success;->message:Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    return-object v0
.end method

.method public getRevalidateAt()Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .registers 2

    .line 304
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Success;->revalidateAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    return-object v0
.end method
