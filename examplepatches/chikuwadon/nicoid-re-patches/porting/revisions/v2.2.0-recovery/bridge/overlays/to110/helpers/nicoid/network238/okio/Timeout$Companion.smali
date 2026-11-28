.class public final Lnicoid/network238/okio/Timeout$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/Timeout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001a\u0010\u0006\u001a\u00020\u0005*\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tJ\u0019\u0010\u0006\u001a\u00020\u0005*\u00020\u00052\u0006\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0016\u0010\u000e\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u00072\u0006\u0010\u0010\u001a\u00020\u0007R\u0010\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0011"
    }
    d2 = {
        "Lnicoid/network238/okio/Timeout$Companion;",
        "",
        "<init>",
        "()V",
        "NONE",
        "Lnicoid/network238/okio/Timeout;",
        "timeout",
        "",
        "unit",
        "Lnicoid/network238/kotlin/time/DurationUnit;",
        "duration",
        "Lnicoid/network238/kotlin/time/Duration;",
        "timeout-HG0u8IE",
        "(Lnicoid/network238/okio/Timeout;J)Lnicoid/network238/okio/Timeout;",
        "minTimeout",
        "aNanos",
        "bNanos",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 333
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okio/Timeout$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final minTimeout(JJ)J
    .registers 8

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-eqz v2, :cond_1

    cmp-long v0, p3, v0

    if-eqz v0, :cond_0

    cmp-long v0, p1, p3

    if-gez v0, :cond_1

    :cond_0
    return-wide p1

    :cond_1
    return-wide p3
.end method

.method public final timeout(Lnicoid/network238/okio/Timeout;JLnicoid/network238/kotlin/time/DurationUnit;)Lnicoid/network238/okio/Timeout;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 343
    invoke-static {p4}, Lnicoid/network238/kotlin/time/DurationUnitKt;->toTimeUnit(Lnicoid/network238/kotlin/time/DurationUnit;)Ljava/util/concurrent/TimeUnit;

    move-result-object p4

    invoke-virtual {p1, p2, p3, p4}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    move-result-object p1

    return-object p1
.end method

.method public final timeout-HG0u8IE(Lnicoid/network238/okio/Timeout;J)Lnicoid/network238/okio/Timeout;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 347
    invoke-static {p2, p3}, Lnicoid/network238/kotlin/time/Duration;->getInWholeNanoseconds-impl(J)J

    move-result-wide p2

    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, p2, p3, v0}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    move-result-object p1

    return-object p1
.end method
