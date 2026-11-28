.class public final Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$schedule$2;
.super Lnicoid/network238/okhttp3/internal/concurrent/Task;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule(Ljava/lang/String;JLnicoid/network238/kotlin/jvm/functions/Function0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/concurrent/TaskQueue$schedule$2",
        "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
        "runOnce",
        "",
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
.field final synthetic $block:Lnicoid/network238/kotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnicoid/network238/kotlin/jvm/functions/Function0;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;Lnicoid/network238/kotlin/jvm/functions/Function0;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")V"
        }
    .end annotation

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$schedule$2;->$block:Lnicoid/network238/kotlin/jvm/functions/Function0;

    .line 91
    const/4 p2, 0x0

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lnicoid/network238/okhttp3/internal/concurrent/Task;-><init>(Ljava/lang/String;ZILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method


# virtual methods
.method public runOnce()J
    .registers 3

    .line 92
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$schedule$2;->$block:Lnicoid/network238/kotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    return-wide v0
.end method
