.class public final Lnicoid/network238/okio/Timeout$Companion$NONE$1;
.super Lnicoid/network238/okio/Timeout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/Timeout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0006\u001a\u00020\u00012\u0006\u0010\u0006\u001a\u00020\u0003H\u0016J\u0008\u0010\u0007\u001a\u00020\u0008H\u0016\u00a8\u0006\t"
    }
    d2 = {
        "nicoid/network238/okio/Timeout$Companion$NONE$1",
        "Lnicoid/network238/okio/Timeout;",
        "timeout",
        "",
        "unit",
        "Ljava/util/concurrent/TimeUnit;",
        "deadlineNanoTime",
        "throwIfReached",
        "",
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
.method constructor <init>()V
    .registers 1

    .line 334
    invoke-direct {p0}, Lnicoid/network238/okio/Timeout;-><init>()V

    return-void
.end method


# virtual methods
.method public deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;
    .registers 3

    return-object p0
.end method

.method public throwIfReached()V
    .registers 1

    return-void
.end method

.method public timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;
    .registers 4

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method
