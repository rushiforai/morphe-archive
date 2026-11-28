.class public final Lnicoid/network238/okhttp3/Dispatcher$promoteAndExecute$Effects;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/Dispatcher;->promoteAndExecute(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Effects"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000!\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001B#\u0012\u0010\u0010\u0002\u001a\u000c\u0012\u0008\u0012\u00060\u0004R\u00020\u00050\u0003\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tR\u001b\u0010\u0002\u001a\u000c\u0012\u0008\u0012\u00060\u0004R\u00020\u00050\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "nicoid/network238/okhttp3/Dispatcher$promoteAndExecute$Effects",
        "",
        "callsToExecute",
        "",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "idleCallbackToRun",
        "Ljava/lang/Runnable;",
        "<init>",
        "(Ljava/util/List;Ljava/lang/Runnable;)V",
        "getCallsToExecute",
        "()Ljava/util/List;",
        "getIdleCallbackToRun",
        "()Ljava/lang/Runnable;",
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
.field private final callsToExecute:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;",
            ">;"
        }
    .end annotation
.end field

.field private final idleCallbackToRun:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/Runnable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;",
            ">;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    iput-object p1, p0, Lnicoid/network238/okhttp3/Dispatcher$promoteAndExecute$Effects;->callsToExecute:Ljava/util/List;

    .line 181
    iput-object p2, p0, Lnicoid/network238/okhttp3/Dispatcher$promoteAndExecute$Effects;->idleCallbackToRun:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final getCallsToExecute()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;",
            ">;"
        }
    .end annotation

    .line 180
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher$promoteAndExecute$Effects;->callsToExecute:Ljava/util/List;

    return-object v0
.end method

.method public final getIdleCallbackToRun()Ljava/lang/Runnable;
    .registers 2

    .line 181
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher$promoteAndExecute$Effects;->idleCallbackToRun:Ljava/lang/Runnable;

    return-object v0
.end method
