.class public final Lnicoid/network238/okhttp3/internal/connection/AddressPolicy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B%\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R\u0010\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\t"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/AddressPolicy;",
        "",
        "minimumConcurrentCalls",
        "",
        "backoffDelayMillis",
        "",
        "backoffJitterMillis",
        "<init>",
        "(IJI)V",
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
.field public final backoffDelayMillis:J

.field public final backoffJitterMillis:I

.field public final minimumConcurrentCalls:I


# direct methods
.method public constructor <init>()V
    .registers 8

    const/4 v5, 0x7

    const/4 v6, 0x0

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/connection/AddressPolicy;-><init>(IJIILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(IJI)V
    .registers 5

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput p1, p0, Lnicoid/network238/okhttp3/internal/connection/AddressPolicy;->minimumConcurrentCalls:I

    .line 29
    iput-wide p2, p0, Lnicoid/network238/okhttp3/internal/connection/AddressPolicy;->backoffDelayMillis:J

    .line 31
    iput p4, p0, Lnicoid/network238/okhttp3/internal/connection/AddressPolicy;->backoffJitterMillis:I

    return-void
.end method

.method public synthetic constructor <init>(IJIILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 7

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_0

    const/4 p1, 0x0

    :cond_0
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_1

    const-wide/32 p2, 0xea60

    :cond_1
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_2

    const/16 p4, 0x64

    .line 21
    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/internal/connection/AddressPolicy;-><init>(IJI)V

    return-void
.end method
