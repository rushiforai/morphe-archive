.class public final Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Failure;
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
    name = "Failure"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0014\u0010\u0004\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Failure;",
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;",
        "revalidateAt",
        "Lnicoid/network238/kotlin/time/ComparableTimeMark;",
        "expireAt",
        "exception",
        "Ljava/io/IOException;",
        "<init>",
        "(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/io/IOException;)V",
        "getRevalidateAt",
        "()Lnicoid/network238/kotlin/time/ComparableTimeMark;",
        "getExpireAt",
        "getException",
        "()Ljava/io/IOException;",
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
.field private final exception:Ljava/io/IOException;

.field private final expireAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

.field private final revalidateAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/io/IOException;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 297
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 298
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Failure;->revalidateAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    .line 299
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Failure;->expireAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    .line 300
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Failure;->exception:Ljava/io/IOException;

    return-void
.end method


# virtual methods
.method public final getException()Ljava/io/IOException;
    .registers 2

    .line 300
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Failure;->exception:Ljava/io/IOException;

    return-object v0
.end method

.method public getExpireAt()Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .registers 2

    .line 299
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Failure;->expireAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    return-object v0
.end method

.method public getRevalidateAt()Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .registers 2

    .line 298
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Failure;->revalidateAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    return-object v0
.end method
