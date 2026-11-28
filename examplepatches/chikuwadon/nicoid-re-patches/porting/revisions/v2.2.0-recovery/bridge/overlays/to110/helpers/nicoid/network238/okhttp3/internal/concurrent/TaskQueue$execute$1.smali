.class public final Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$execute$1;
.super Lnicoid/network238/okhttp3/internal/concurrent/Task;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute(Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;)V
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
        "nicoid/network238/okhttp3/internal/concurrent/TaskQueue$execute$1",
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
.method constructor <init>(Ljava/lang/String;ZLnicoid/network238/kotlin/jvm/functions/Function0;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")V"
        }
    .end annotation

    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$execute$1;->$block:Lnicoid/network238/kotlin/jvm/functions/Function0;

    .line 110
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/concurrent/Task;-><init>(Ljava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method public runOnce()J
    .registers 3

    .line 112
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$execute$1;->$block:Lnicoid/network238/kotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    const-wide/16 v0, -0x1

    return-wide v0
.end method
