.class final Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Entry"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0002\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u001f\u0010\u0004\u001a\u0010\u0012\u000c\u0012\n \u0007*\u0004\u0018\u00010\u00060\u00060\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\t\u00a8\u0006\n"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;",
        "",
        "<init>",
        "()V",
        "state",
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;",
        "nicoid.network238.kotlin.jvm.PlatformType",
        "getState",
        "()Ljava/util/concurrent/atomic/AtomicReference;",
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
.field private final state:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 8

    .line 273
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 274
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    const/4 v5, 0x7

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;-><init>(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;->state:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method


# virtual methods
.method public final getState()Ljava/util/concurrent/atomic/AtomicReference;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;",
            ">;"
        }
    .end annotation

    .line 274
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;->state:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method
